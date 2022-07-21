//
//  ViewController.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 12-07-22.
//

import UIKit

class FruitsViewController: UIViewController, Coordinating {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FruitsTableViewCell.self, forCellReuseIdentifier: FruitsTableViewCell.identifier)
        
        return tableView
    }()
    
    // MARK: Public properties
    
    var coordinator: Coordinator?
    
    let viewModel = FruitsViewModel()
    
    // MARK: Private properties
    
    private let spinner = Spinner()
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        bindViewModel()
        loadData()
    }

    // MARK: Private methods
    
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Fruitspedia"
        navigationController?.navigationBar.tintColor = UIColor.black
        
        // Table View
        tableView.delegate = self
        tableView.dataSource = self
        
        // Adding subviews
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            // Table View
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
        ])
    }
    
    private func bindViewModel() {
        viewModel.fruits.bind { _ in
            self.spinner.hideSpinner()
            self.tableView.reloadData()
        }
        
        viewModel.error.bind { error in
            guard let message = self.viewModel.errorMessage else { return }
            
            if error {
                self.showAlert(message: message)
            }
        }
    }
    
    private func loadData() {
        spinner.showSpinner(self)
        viewModel.fetchData()
    }
    
}

// MARK: - Extensions

extension FruitsViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fruits.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FruitsTableViewCell.identifier,
            for: indexPath
        ) as? FruitsTableViewCell else { return UITableViewCell() }
        cell.fruit = viewModel.fruits.value[indexPath.row]

        return cell
    }
    
}

extension FruitsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.fruits.value[indexPath.row]
        viewModel.selectedItem = item
        
        coordinator?.navigate(to: .detail(viewModel.selectedItem!))
    }
    
}

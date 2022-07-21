//
//  FruitDetailCitrusViewController.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 21-07-22.
//

import UIKit

class FruitDetailViewController: UIViewController, Coordinating {
    
    let viewContainer: UIView = {
        let viewContainer = UIView()
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.backgroundColor = .white
        
        return viewContainer
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let familyLabel: UILabel = {
        let familyLabel = UILabel()
        
        return familyLabel
    }()
    
    let genusLabel: UILabel = {
        let genusLabel = UILabel()
        
        return genusLabel
    }()
    
    let nutritionLabel: UILabel = {
        let nutritionLabel = UILabel()
        nutritionLabel.numberOfLines = 0
        
        return nutritionLabel
    }()
    
    // MARK: Public properties
    
    var coordinator: Coordinator?
    
    let viewModel = FruitDetailViewModel()
    
    // MARK: Private properties

    // MARK: Life cycle
    
    init(selectedItem: FruitModel) {
        viewModel.fruit = selectedItem
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        loadData()
    }

    // MARK: Private methods
    
    private func setupView() {
        // Adding subviews
        view.addSubview(viewContainer)
        viewContainer.addSubview(stackView)

        stackView.addArrangedSubview(familyLabel)
        stackView.addArrangedSubview(genusLabel)
        stackView.addArrangedSubview(nutritionLabel)

        NSLayoutConstraint.activate([
            // Container View
            viewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0),
            viewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
            // Stack View
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 30),
        ])
        
        viewContainer.backgroundColor = viewModel.fruit.isCitrus() ? .systemGreen : .white
    }
    
    private func loadData() {
        // Labels
        familyLabel.text = "Family: \(viewModel.fruit.family ?? "")"
        genusLabel.text = "Genus: \(viewModel.fruit.genus ?? "")"
        nutritionLabel.text = """
        Sugar: \(viewModel.fruit.nutritions?.sugar ?? 0)
        Calories: \(viewModel.fruit.nutritions?.calories ?? 0)
        Fat: \(viewModel.fruit.nutritions?.fat ?? 0)
        """
    }
    
}

//
//  FruitsTableViewCell.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import UIKit

class FruitsTableViewCell: UITableViewCell {

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let fruitLabel: UILabel = {
        let fruitLabel = UILabel()
        
        return fruitLabel
    }()
    
    let sugarLabel: UILabel = {
        let sugarLabel = UILabel()
        
        return sugarLabel
    }()
    
    static let identifier = String(describing: FruitsTableViewCell.self)
    
    var fruit: FruitModel? = nil {
        didSet {
            fruitLabel.text = "\(fruit?.isCitrus() ?? false ? " * " : "") \(fruit?.name ?? "")"
            sugarLabel.text = "(Sugar: \(fruit?.nutritions?.sugar ?? 0.0) )"
        }
    }

    // MARK: Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        fruitLabel.text = ""
        sugarLabel.text = ""
    }
    
    // MARK: Private methods
    
    private func setupView() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(fruitLabel)
        stackView.addArrangedSubview(sugarLabel)
        
        NSLayoutConstraint.activate([
            fruitLabel.heightAnchor.constraint(equalToConstant: 50),
            fruitLabel.widthAnchor.constraint(equalToConstant: 100),
            sugarLabel.heightAnchor.constraint(equalToConstant: 50),
            // Stack View
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }

}

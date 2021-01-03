//
//  FooterView.swift
//  AdApp
//
//  Created by Angelina on 03.01.2021.
//

import UIKit

class FooterView: UICollectionReusableView {
    
    //MARK: - Public properties
    static let identifier = "FooterView"
    var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Выбрать", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    var onChoose: (()->Void)?
    
  //MARK: - Public funcs
    func configure() {
        backgroundColor = .clear
        addSubview(button)
        button.addTarget(self, action: #selector(choose), for: .touchUpInside)
        layoutConstraints()
    }
    
    //MARK: - Private funcs
    private func layoutConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
    }
    
    //MARK: - Objc funcs
    @objc func choose() {
        onChoose?()
    }
}

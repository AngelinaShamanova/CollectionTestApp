//
//  HeaderView.swift
//  CollectionTestApp
//
//  Created by Angelina on 03.01.2021.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    //MARK: - Public properties
    static let identifier = "HeaderView"
    
    var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close.png"), for: .normal)
        return button
    }()
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Сделайте объявление заметнее на 7 дней"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    //MARK: - Public funcs
    func configure() {
        backgroundColor = .clear
        addSubview(button)
        addSubview(label)
        layoutConstraints()
    }
    
    //MARK: - Private funcs
    private func layoutConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 60).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 25).isActive = true
    }
}

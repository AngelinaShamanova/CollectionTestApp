//
//  CollectionViewCell.swift
//  CollectionTestApp
//
//  Created by Angelina on 03.01.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static var cellId = "cellId"
    
    var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "xl.png")
        return img
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "XL-объявление"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        return label
    }()
    var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Пользователи смогут посмотреть фотографии, описание и телефон прямо из результатов поиска."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "350 ₽"
        label.textAlignment = .left
        return label
    }()
    var selectedImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "checkmark.png")
        img.backgroundColor = .clear
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(priceLabel)
        addSubview(selectedImageView)
        layoutConstraints()
        backgroundColor = .systemGray5
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    private func layoutConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 25).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: selectedImageView.leadingAnchor, constant: 15).isActive = true
        
        selectedImageView.translatesAutoresizingMaskIntoConstraints = false
        selectedImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        selectedImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        selectedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        selectedImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: selectedImageView.leadingAnchor, constant: -25).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 25).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 15).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 25).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: selectedImageView.leadingAnchor, constant: 15).isActive = true
    }
    
}

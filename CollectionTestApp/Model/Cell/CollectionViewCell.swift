//
//  CollectionViewCell.swift
//  CollectionTestApp
//
//  Created by Angelina on 03.01.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - Public properties
    static var cellId = "cellId"
    
    var imageView = ImageView()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .left
        return label
    }()
    var detailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
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
    var withAnimation = false {
        didSet {
            layoutSubviews()
        }
    }
    
    //MARK: - Override funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if withAnimation {
            alpha = 0
            UIView.animate(withDuration: 0.6) {
                self.alpha = 1
            }
        }
    }
    
    //MARK: - Public funcs
    func configure(with list: List) {
        self.titleLabel.text = list.title
        self.detailLabel.text = list.description
        self.priceLabel.text = list.price
        self.imageView.fetchImage(with: list.icon.the52X52)
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(priceLabel)
        addSubview(selectedImageView)
        selectedImageView.isHidden = true
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
        titleLabel.trailingAnchor.constraint(equalTo: selectedImageView.leadingAnchor, constant: -25).isActive = true
        
        selectedImageView.translatesAutoresizingMaskIntoConstraints = false
        selectedImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        selectedImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        selectedImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        selectedImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 25).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: selectedImageView.leadingAnchor, constant: -25).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 25).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: selectedImageView.leadingAnchor, constant: 15).isActive = true
        priceLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10).isActive = true
    }
}

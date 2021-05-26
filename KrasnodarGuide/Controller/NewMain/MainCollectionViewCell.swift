//
//  MainCollectionViewCell.swift
//  KrasnodarGuide
//
//  Created by user on 26.05.2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let reuseId = "MainCollectionViewCell"
    
    private var image: UIImageView  = UIImageView(image: UIImage())
    private let titleLabel: UILabel = UILabel()
    private let categoryLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        // MARK: image
        contentView.addSubview(image)
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 3/4).isActive = true
        
        // MARK: titleLabel
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        titleLabel.sizeToFit()
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 2).isActive = true
        
        // MARK: categoryLabel
        
        contentView.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.numberOfLines = 1
        categoryLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 12)
        categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ item:CollectionViewItemProtocol) {
        self.image.image = UIImage(named: item.image)
        self.titleLabel.text = item.name
        self.categoryLabel.text = "Тип"
    }
}

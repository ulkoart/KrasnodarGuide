//
//  PersonDetailCell.swift
//  KrasnodarGuide
//
//  Created by user on 13/05/2021.
//

import UIKit

final class PersonDetailCell: UICollectionViewCell {
    private var personPhoto: UIImageView  = UIImageView(image: UIImage())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(personPhoto)
        personPhoto.translatesAutoresizingMaskIntoConstraints = false
        personPhoto.contentMode = .scaleAspectFill
        
        personPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        personPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        personPhoto.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        personPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with photoName: String) {
        self.personPhoto.image = UIImage(named: photoName)
    }
}

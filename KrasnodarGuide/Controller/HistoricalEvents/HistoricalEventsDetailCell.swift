//
//  HistoricalEventsDetailCell.swift
//  KrasnodarGuide
//
//  Created by user on 17/05/2021.
//

import UIKit

final class HistoricalEventsDetailCell: UICollectionViewCell {
    private var photo: UIImageView  = UIImageView(image: UIImage())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFill
        
        photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        photo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with photoName: String) {
        self.photo.image = UIImage(named: photoName)
    }
}

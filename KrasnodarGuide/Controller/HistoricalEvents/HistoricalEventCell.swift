//
//  HistoricalEventCell.swift
//  KrasnodarGuide
//
//  Created by user on 15.05.2021.
//

import UIKit

class HistoricalEventCell: UITableViewCell {
    
    private var historicalEventImage: UIImageView  = UIImageView(image: UIImage())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(historicalEventImage)
        
        // MARK: - historicalEventImage
        historicalEventImage.translatesAutoresizingMaskIntoConstraints = false
        historicalEventImage.contentMode = .scaleAspectFill
        
        historicalEventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        historicalEventImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        historicalEventImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        historicalEventImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        historicalEventImage.layer.cornerRadius = 15
        historicalEventImage.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with historicalEvent: HistoricalEvent) {
        self.historicalEventImage.image = UIImage(named: historicalEvent.image)
    }
    
}

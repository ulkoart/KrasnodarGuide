//
//  HistoricalEventCell.swift
//  KrasnodarGuide
//
//  Created by user on 15.05.2021.
//

import UIKit

class HistoricalEventCell: UITableViewCell {
    
    private var cellView: UIView = UIView()
    private var labelView: UIView = UIView()
    private var historicalEventImage: UIImageView  = UIImageView(image: UIImage())
    private var titleLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellView.addSubview(historicalEventImage)
        cellView.addSubview(labelView)
        labelView.addSubview(titleLabel)
        contentView.addSubview(cellView)
        
        // MARK: - cellView
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius = 15
        cellView.clipsToBounds = true
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        // MARK: - historicalEventImage
        historicalEventImage.translatesAutoresizingMaskIntoConstraints = false
        historicalEventImage.contentMode = .scaleAspectFill
        historicalEventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        historicalEventImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        historicalEventImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        historicalEventImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        // MARK: - labelView
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 1/3).isActive = true
        labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        labelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        labelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        labelView.backgroundColor = UIColor("#052D6E", alpha: 0.5)
        
        // MARK: - titleLabel
        
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name: "DINAlternate-Bold", size: 14)
        titleLabel.numberOfLines = 1
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: labelView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with historicalEvent: HistoricalEvent) {
        self.historicalEventImage.image = UIImage(named: historicalEvent.image)
        self.titleLabel.text = historicalEvent.title
    }
    
}

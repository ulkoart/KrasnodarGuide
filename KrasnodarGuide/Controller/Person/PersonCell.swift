//
//  PersonTVC.swift
//  KrasnodarGuide
//
//  Created by user on 12.05.2021.
//

import UIKit

final class PersonCell: UITableViewCell {
    private var personImage: UIImageView  = UIImageView(image: UIImage())
    private var nameLabel: UILabel = UILabel()
    private var yearsLabel: UILabel = UILabel()
    private var descriptionLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(personImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(yearsLabel)
        contentView.addSubview(descriptionLabel)
        
        // MARK: - personImage
        personImage.translatesAutoresizingMaskIntoConstraints = false
        personImage.contentMode = .scaleAspectFill
        
        personImage.widthAnchor.constraint(equalToConstant: 76).isActive = true
        personImage.heightAnchor.constraint(equalToConstant: 92).isActive = true
        personImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        personImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        personImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        // MARK: - nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 4).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
//        nameLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        // MARK: - yearsLabel
        yearsLabel.translatesAutoresizingMaskIntoConstraints = false
        yearsLabel.numberOfLines = 1
        yearsLabel.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        
        yearsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        yearsLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 4).isActive = true
        yearsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
//        yearsLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        // MARK: - descriptionLabel
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 1
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)

        descriptionLabel.topAnchor.constraint(equalTo: yearsLabel.bottomAnchor, constant: 4).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 4).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
//        descriptionLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with person: Person) {
        // self.selectionStyle = .none
        
        self.personImage.image = UIImage(named: person.image)
        self.personImage.layer.cornerRadius = 15.0
        self.personImage.clipsToBounds = true
        self.personImage.layer.borderColor = UIColor.gray.cgColor
        self.personImage.layer.borderWidth = 1.0
        
        self.nameLabel.text = person.name
        self.yearsLabel.text = person.years
        self.descriptionLabel.text = person.description
    }

}

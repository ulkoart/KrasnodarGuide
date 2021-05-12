//
//  PersonTVC.swift
//  KrasnodarGuide
//
//  Created by user on 12.05.2021.
//

import UIKit

final class PersonTVC: UITableViewCell {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(with person: Person) {
        self.personImage.image = UIImage(named: person.image)
        self.personImage.layer.cornerRadius = 15.0
        self.personImage.clipsToBounds = true
        self.personImage.layer.borderColor = UIColor.gray.cgColor
        self.personImage.layer.borderWidth = 1.0
        
        self.nameLabel.text = person.name
        self.descriptionLabel.text = person.description
    }

}

//
//  PhotoCell.swift
//  KrasnodarGuide
//
//  Created by user on 08/04/2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoSight: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ photo: UIImage) {
        photoSight.image = photo
    }
    
}

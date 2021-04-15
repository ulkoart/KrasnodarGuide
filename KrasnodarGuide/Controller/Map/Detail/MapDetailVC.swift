//
//  MapDetailVC.swift
//  KrasnodarGuide
//
//  Created by user on 08/04/2021.
//

import UIKit

class MapDetailVC: UIViewController {
    @IBOutlet weak var sightTitileLable: UILabel!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var photoCollectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var photoCollectionPageControl: UIPageControl!
    
    weak var sight: Sight!
    
    let cellID = "PhotoCell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        sightTitileLable.text = sight.name
        photoCollectionPageControl.isUserInteractionEnabled = false
        photoCollectionView.isPagingEnabled = true
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.showsHorizontalScrollIndicator = false
        photoCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            guard
                let photoVC = segue.destination as? ShowPhotoVC,
                let photoName = sender as? String,
                let photoImage = UIImage(named: photoName)
            else { return }
            photoVC.image = photoImage
        }
    }
}

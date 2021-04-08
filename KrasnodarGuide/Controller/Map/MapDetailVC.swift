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
    
    let data = [
        UIColor.green,
        UIColor.yellow,
        UIColor.brown,
        UIColor.red
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        sightTitileLable.text = sight.name
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.showsHorizontalScrollIndicator = false
        photoCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        
        photoCollectionPageControl.numberOfPages = data.count
    }
}

extension MapDetailVC: UICollectionViewDelegate {}

extension MapDetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        let index = indexPath.item
        let color = data[index]
        cell.setup(color: color)
        
        return cell
    }
}

extension MapDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(photoCollectionView.frame.size.width)
        return photoCollectionView.frame.size
    }
}

//
//  MapDetailVCExtensions.swift
//  KrasnodarGuide
//
//  Created by user on 09.04.2021.
//

import UIKit

extension MapDetailVC: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.photoCollectionPageControl?.currentPage = Int(roundedIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        let photoName: String = sight.photos[index]
        performSegue(withIdentifier: "showPhoto", sender: photoName)
    }
}

extension MapDetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCollectionPageControl.numberOfPages = sight.photos.count
        return sight.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        let index = indexPath.item

        guard let photo = UIImage(named: sight.photos[index]) else {
            return cell
        }
        
        cell.setup(photo)
        
        return cell
    }
}

extension MapDetailVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return photoCollectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

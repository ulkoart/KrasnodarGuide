//
//  HistoricalEventsDetail.swift
//  KrasnodarGuide
//
//  Created by user on 17/05/2021.
//

import UIKit

final class HistoricalEventsDetail: UIViewController {


    @IBOutlet weak var historicalEventsCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var historicalEventText: UILabel!
    
    var historicalEvent: HistoricalEvent!
    let cellId: String = "HistoricalEventsDetailCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = historicalEvent.shortTitle
        historicalEventText.text = historicalEvent.description
        pageControl.isUserInteractionEnabled = false
        historicalEventsCollection.isPagingEnabled = true
        historicalEventsCollection.delegate = self
        historicalEventsCollection.dataSource = self
        historicalEventsCollection.showsHorizontalScrollIndicator = false
        historicalEventsCollection.register(HistoricalEventsDetailCell.self, forCellWithReuseIdentifier: cellId)
    }
}

extension HistoricalEventsDetail: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = historicalEvent.photos.count
        return historicalEvent.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HistoricalEventsDetailCell else { return UICollectionViewCell() }
        cell.setup(with: historicalEvent.photos[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        let photoName: String = historicalEvent.photos[index]
        
        guard let photoImage = UIImage(named: photoName) else { return }
        
        let showPhotoViewController: ShowPhotoViewController = ShowPhotoViewController()
        showPhotoViewController.image = photoImage
        showPhotoViewController.photoTitle = historicalEvent.title
        present(showPhotoViewController, animated: true, completion: nil)
    }
}

extension HistoricalEventsDetail: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return historicalEventsCollection.frame.size
    }
    
    func HistoricalEventsDetail(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//
//  HistoricalEventsDetail.swift
//  KrasnodarGuide
//
//  Created by user on 17/05/2021.
//

import UIKit

class HistoricalEventsDetail: UIViewController {


    @IBOutlet weak var historicalEventsCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var historicalEvents: HistoricalEvent!
    let cellId: String = "HistoricalEventsDetailCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = historicalEvents.shortTitle
        
        pageControl.isUserInteractionEnabled = false
        historicalEventsCollection.isPagingEnabled = true
        historicalEventsCollection.delegate = self
        historicalEventsCollection.dataSource = self
        historicalEventsCollection.showsHorizontalScrollIndicator = false
        historicalEventsCollection.register(HistoricalEventsDetailCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            guard
                let photoVC = segue.destination as? ShowPhotoVC,
                let photoName = sender as? String,
                let photoImage = UIImage(named: photoName)
            else { return }
            photoVC.image = photoImage
            photoVC.photoTitle = historicalEvents.title
        }
    }
}

extension HistoricalEventsDetail: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = historicalEvents.photos.count
        return historicalEvents.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HistoricalEventsDetailCell else { return UICollectionViewCell() }
        cell.setup(with: historicalEvents.photos[indexPath.row])
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
        let photoName: String = historicalEvents.photos[index]
        performSegue(withIdentifier: "showPhoto", sender: photoName)
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

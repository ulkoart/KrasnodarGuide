//
//  PersonDetail.swift
//  KrasnodarGuide
//
//  Created by user on 13/05/2021.
//

import UIKit

class PersonDetail: UIViewController {
    
    @IBOutlet weak var personPhotoCollection: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personPhotoCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var person: Person!
    
    let cellId: String = "PersonDetailCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        nameLabel.text = self.person.name
    
        pageControl.isUserInteractionEnabled = false
        personPhotoCollectionView.isPagingEnabled = true
        personPhotoCollectionView.delegate = self
        personPhotoCollectionView.dataSource = self
        personPhotoCollectionView.showsHorizontalScrollIndicator = false
        personPhotoCollectionView.register(PersonDetailCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            guard
                let photoVC = segue.destination as? ShowPhotoVC,
                let photoName = sender as? String,
                let photoImage = UIImage(named: photoName)
            else { return }
            photoVC.image = photoImage
            photoVC.photoTitle = person.name
        }
    }
}

extension PersonDetail: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = person.photos.count
        return person.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PersonDetailCell else { return UICollectionViewCell() }
        cell.setup(with: person.photos[indexPath.row])
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
        let photoName: String = person.photos[index]
        performSegue(withIdentifier: "showPhoto", sender: photoName)
    }
}


extension PersonDetail: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return personPhotoCollection.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

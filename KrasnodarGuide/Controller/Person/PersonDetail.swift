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
    
    var person: Person!
    
    let cellId: String = "PersonDetailCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        nameLabel.text = self.person.name
        
        personPhotoCollectionView.isPagingEnabled = true
        personPhotoCollectionView.delegate = self
        personPhotoCollectionView.dataSource = self
        personPhotoCollectionView.showsHorizontalScrollIndicator = false
        personPhotoCollectionView.register(PersonDetailCell.self, forCellWithReuseIdentifier: cellId)
    }
}

extension PersonDetail: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PersonDetailCell else { return UICollectionViewCell() }
        cell.setup(with: person.image)
        return cell
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

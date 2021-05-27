//
//  MainCollectionView.swift
//  KrasnodarGuide
//
//  Created by user on 26.05.2021.
//

import UIKit

protocol CollectionViewItemProtocol {
    var image: String { get }
    var name: String { get }
}

struct Constants {
    static let topDistanceToView: CGFloat = 10
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 10
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2.6
}

final class MainCollectionView: UICollectionView {
    
    var items = [CollectionViewItemProtocol]()
    var type: ContentType!
    var contentType: ContentType?
    var mainViewControllerDelegate: MainViewControllerDelegate?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(withItems items: [CollectionViewItemProtocol], typeOf type: ContentType) {
        self.items = items
        self.type = type
    }
    
}

extension MainCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseId, for: indexPath) as? MainCollectionViewCell else { fatalError() }
        let item = items[indexPath.row]
        cell.setup(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        self.mainViewControllerDelegate?.didSelectItem(withItemName: item.name, withType: self.type)
    }
}

extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.9)
    }
}

//
//  MainViewController.swift
//  KrasnodarGuide
//
//  Created by user on 26.05.2021.
//

import UIKit

protocol MainViewControllerDelegate {
    func didSelectItem()
}

final class MainViewController: UIViewController, MainViewControllerDelegate {
    func didSelectItem() {
        //        tabBarController?.selectedIndex = TabBarMenu.Map.rawValue
        
        let sights = Sight.getSights()
        let sight = sights.randomElement()
        
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MapDetailVC") as? MapDetailVC else {
                return
        }
        detailVC.sight = sight
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "30 июня 1792 года Черноморскому казачьему войску Екатериной II была выдана Жалованная Грамота, по которой казакам на вечное владение передавалась земля. Так и началась история города Краснодара."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "DINAlternate-Bold", size: 15)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private var sightTitleLabel: UILabel = {
        let sightTitleLabel = UILabel()
        sightTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sightTitleLabel.text = "Достопримечательности"
        sightTitleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        sightTitleLabel.backgroundColor = .clear
        return sightTitleLabel
    }()
    
    private var galleryCollectionView = MainCollectionView()
    private let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryCollectionView.mainViewControllerDelegate = self
        self.navigationItem.title = "Гид Краснодара"
        setupScrollView()
        
        // ToDo сделать фильтр по showOnMainScreen: Bool
        let items: [Sight] = Sight.getSights()
        galleryCollectionView.setup(items)
        self.setupUI()
        
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
    }
    
    private func setupUI() {
        // MARK: descriptionLabel
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        // MARK: sightTitle
        
        contentView.addSubview(sightTitleLabel)
        sightTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        sightTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        sightTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        
        // MARK: galleryCollectionView
        
        contentView.addSubview(galleryCollectionView)
        galleryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: sightTitleLabel.bottomAnchor).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        galleryCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

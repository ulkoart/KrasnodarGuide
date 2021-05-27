//
//  MainViewController.swift
//  KrasnodarGuide
//
//  Created by user on 26.05.2021.
//

import UIKit

enum ContentType {
    case sight
    case person
    case historicalEvent
    
    var tabBarItem: Int {
        switch self {
            
        case .sight:
            return TabBarMenu.Map.rawValue
        case .person:
            return TabBarMenu.Persons.rawValue
        case .historicalEvent:
            return TabBarMenu.HistoricalEvent.rawValue
        }
    }
}

protocol MainViewControllerDelegate {
    func didSelectItem(withItemName:String, withType: ContentType)
}

final class MainViewController: UIViewController {
    
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
    
    private var historicalEventsTitleLabel: UILabel = {
        let sightTitleLabel = UILabel()
        sightTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sightTitleLabel.text = "Исторические события"
        sightTitleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        sightTitleLabel.backgroundColor = .clear
        return sightTitleLabel
    }()
    
    private let sightsCollectionView = MainCollectionView()
    private let historicalEventsCollectionView = MainCollectionView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Гид Краснодара"
        setupScrollView()
        
        // ToDo сделать фильтр по showOnMainScreen: Bool
        let sightsItems: [Sight] = Sight.getSights()
        sightsCollectionView.mainViewControllerDelegate = self
        sightsCollectionView.setup(withItems: sightsItems, typeOf: .sight)
        
        let historicalEventsItems: [HistoricalEvent] = HistoricalEvent.getHistoricalEvents()
        historicalEventsCollectionView.mainViewControllerDelegate = self
        historicalEventsCollectionView.setup(withItems: historicalEventsItems, typeOf: .historicalEvent)
        
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
        
        contentView.addSubview(sightsCollectionView)
        sightsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        sightsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        sightsCollectionView.topAnchor.constraint(equalTo: sightTitleLabel.bottomAnchor).isActive = true
        sightsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        // MARK: historicalEventsTitleLabel
        
        contentView.addSubview(historicalEventsTitleLabel)
        historicalEventsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        historicalEventsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        historicalEventsTitleLabel.topAnchor.constraint(equalTo: sightsCollectionView.bottomAnchor).isActive = true
        
        // MARK: historicalEventsCollectionView
        
        contentView.addSubview(historicalEventsCollectionView)
        historicalEventsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        historicalEventsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        historicalEventsCollectionView.topAnchor.constraint(equalTo: historicalEventsTitleLabel.bottomAnchor).isActive = true
        historicalEventsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5).isActive = true
        historicalEventsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

extension MainViewController: MainViewControllerDelegate {
    func didSelectItem(withItemName itemName: String, withType itemType: ContentType) {
        
        guard
            let tabBarController = self.tabBarController,
            let navigationController = tabBarController.viewControllers?[itemType.tabBarItem] as? UINavigationController
            else { fatalError() }
        
        switch itemType {
        
        case .sight:
            guard let vc = UIStoryboard(
                name: "Main",
                bundle: nil
            ).instantiateViewController(withIdentifier: TabBarMenu.Map.viewControlerIdentifier) as? MapVC else { return }
            vc.forcePushItemName = itemName
            navigationController.viewControllers = [vc]
            tabBarController.selectedIndex = TabBarMenu.Map.rawValue
        
        case .person:
            break
        
        case .historicalEvent:
            guard let vc = UIStoryboard(
                name: "Main",
                bundle: nil
            ).instantiateViewController(withIdentifier: TabBarMenu.HistoricalEvent.viewControlerIdentifier) as? HistoricalEventsVC else { return }
            vc.forcePushItemName = itemName
            navigationController.viewControllers = [vc]
            tabBarController.selectedIndex = TabBarMenu.HistoricalEvent.rawValue
        }
    }
}

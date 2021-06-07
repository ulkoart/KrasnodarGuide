//
//  MainViewController.swift
//  KrasnodarGuide
//
//  Created by user on 26.05.2021.
//
// color scheme https://colorscheme.ru/#0S61Tw0w0w0w0
// uicolor.io -> Convert HEX & RGB colors to UIColor
// https://icon-icons.com/
// https://www.flaticon.com/

import UIKit

protocol MainViewControllerDelegate {
    func didSelectItem(withItemName:String, withType: ContentType)
}

final class MainViewController: UIViewController {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "30 июня 1792 года Черноморскому казачьему войску Екатериной II была выдана Жалованная Грамота, по которой казакам на вечное владение передавалась земля. Так и началась история города Краснодара."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private var sightTitleLabel: UILabel = {
        let sightTitleLabel = UILabel()
        sightTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sightTitleLabel.text = "Достопримечательности"
        sightTitleLabel.font = UIFont(name: "AvenirNext-Medium", size: 22)
        sightTitleLabel.backgroundColor = .clear
        return sightTitleLabel
    }()
    
    private var historicalEventsTitleLabel: UILabel = {
        let historicalEventsTitleLabel = UILabel()
        historicalEventsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        historicalEventsTitleLabel.text = "Исторические события"
        historicalEventsTitleLabel.font = UIFont(name: "AvenirNext-Medium", size: 22)
        historicalEventsTitleLabel.backgroundColor = .clear
        return historicalEventsTitleLabel
    }()
    
    private var personTitleLabel: UILabel = {
        let personTitleLabel = UILabel()
        personTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        personTitleLabel.text = "История в лицах"
        personTitleLabel.font = UIFont(name: "AvenirNext-Medium", size: 22)
        personTitleLabel.backgroundColor = .clear
        return personTitleLabel
    }()
    
    private let sightsCollectionView = MainCollectionView()
    private let historicalEventsCollectionView = MainCollectionView()
    private let personsCollectionView = MainCollectionView()
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
        
        let personsItems: [Person] = Person.getPersons()
        personsCollectionView.mainViewControllerDelegate = self
        personsCollectionView.setup(withItems: personsItems, typeOf: .person)
        
        self.setupUI()
        
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        // MARK: sightTitle
        
        contentView.addSubview(sightTitleLabel)
        sightTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
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
        historicalEventsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        historicalEventsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        historicalEventsTitleLabel.topAnchor.constraint(equalTo: sightsCollectionView.bottomAnchor).isActive = true
        
        // MARK: historicalEventsCollectionView
        
        contentView.addSubview(historicalEventsCollectionView)
        historicalEventsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        historicalEventsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        historicalEventsCollectionView.topAnchor.constraint(equalTo: historicalEventsTitleLabel.bottomAnchor).isActive = true
        historicalEventsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5).isActive = true
        
        // MARK: personTitleLabel
        
        contentView.addSubview(personTitleLabel)
        personTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        personTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        personTitleLabel.topAnchor.constraint(equalTo: historicalEventsCollectionView.bottomAnchor).isActive = true
        
        // MARK: personsCollectionView
        
        contentView.addSubview(personsCollectionView)
        personsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        personsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        personsCollectionView.topAnchor.constraint(equalTo: personTitleLabel.bottomAnchor).isActive = true
        personsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4).isActive = true
        personsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
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
            guard let vc = UIStoryboard(
                name: "Main",
                bundle: nil
            ).instantiateViewController(withIdentifier: TabBarMenu.Persons.viewControlerIdentifier) as? PersonVC else { return }
            vc.forcePushItemName = itemName
            navigationController.setViewControllers([vc], animated: false)
            tabBarController.selectedIndex = TabBarMenu.Persons.rawValue
            
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

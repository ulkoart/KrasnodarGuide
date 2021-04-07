//
//  MainVCExtensions.swift
//  KrasnodarGuide
//
//  Created by user on 25.03.2021.
//  Нужен ли делигат/делигаты для всего происходящего?

import UIKit

extension MainVC {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    func setupUI() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = titleView.bounds
        gradientLayer.colors = [
            UIColor(red: 1.00, green: 0.64, blue: 0.00, alpha: 1.00).cgColor,
            UIColor(red: 1.00, green: 0.80, blue: 0.45, alpha: 1.00).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.75, y: 0.75)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        titleView.layer.insertSublayer(gradientLayer, at: 0)

//        self.navigationItem.title = "Краснодар"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        let button = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass.circle") , style: .plain, target: nil, action: nil)
//        navigationItem.leftBarButtonItem = button
        
    }
}
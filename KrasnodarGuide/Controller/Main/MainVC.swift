//
//  MainVC.swift
//  KrasnodarGuide
//
//  Created by user on 25.03.2021.
//
// color scheme https://colorscheme.ru/#0S61Tw0w0w0w0
// uicolor.io -> Convert HEX & RGB colors to UIColor

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mapButtonPressed(_ sender: UIButton) {
        print(TabBarMenu.Main.rawValue)
        tabBarController?.selectedIndex = TabBarMenu.Map.rawValue // ну хз, странно
    }
}

enum TabBarMenu: Int {
    case Main
    case Map
}

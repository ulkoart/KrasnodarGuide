//
//  MainVC.swift
//  KrasnodarGuide
//
//  Created by user on 25.03.2021.
//
// color scheme https://colorscheme.ru/#0S61Tw0w0w0w0
// uicolor.io -> Convert HEX & RGB colors to UIColor
// https://icon-icons.com/
// https://www.flaticon.com/

import UIKit

enum TabBarMenu: Int {
    case Main
    case Map
}

final class MainVC: UIViewController {
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var mapViewCell: MainScreenCellView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mapButtonPressed(_ sender: UIButton) {
        tabBarController?.selectedIndex = TabBarMenu.Map.rawValue
    }
}

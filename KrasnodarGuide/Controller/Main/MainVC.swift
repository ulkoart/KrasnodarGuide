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
    case Persons
    case HistoricalEvent
}

final class MainVC: UIViewController {
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mapButtonPressed(_ sender: UIButton) {
        tabBarController?.selectedIndex = TabBarMenu.Map.rawValue
    }
    
    @IBAction func personButtonPressed(_ sender: UIButton) {
        tabBarController?.selectedIndex = TabBarMenu.Persons.rawValue
    }
    
    @IBAction func HistoricalEventButtonPressed(_ sender: UIButton) {
        tabBarController?.selectedIndex = TabBarMenu.HistoricalEvent.rawValue
    }
    
    
    
}

@IBDesignable class MainViewCell: UIView {}

extension MainViewCell {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
            
//            let shadowSize: CGFloat = 20
//            let contactRect = CGRect(x: -shadowSize, y: self.bounds.size.height - (shadowSize * 0.4), width: self.bounds.size.width + shadowSize * 2, height: shadowSize)
//            self.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
//            self.layer.shadowRadius = 5
//            self.layer.shadowOpacity = 0.4
        }
    }
}

// ToDo сделать белый бордер и тень

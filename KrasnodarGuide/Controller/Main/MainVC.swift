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

protocol MainVCDelegate {
  func toggleLeftPanel()
  func collapseSidePanels()
}

final class MainVC: UIViewController {
        
    @IBOutlet weak var titleLabelView: UILabel!
    
    @IBAction func menuButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.toggleLeftPanel()
    }
    
    var delegate: MainVCDelegate?
    
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
        }
    }
}

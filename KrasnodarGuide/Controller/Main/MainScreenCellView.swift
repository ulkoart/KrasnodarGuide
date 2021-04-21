//
//  MainScreenCellView.swift
//  KrasnodarGuide
//
//  Created by user on 21.04.2021.
//

import UIKit

@IBDesignable class MainScreenCellView: UIView {}

extension MainScreenCellView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

//
//  Router.swift
//  KrasnodarGuide
//
//  Created by user on 11.06.2021.
//

import UIKit

final class Router {
    
    var alertVC: UIViewController = .init()
    var alertWindow: UIWindow = .init()
    
    init() {
        alertVC.view.frame = UIScreen.main.bounds
        alertVC.view.backgroundColor = .clear
        alertWindow.rootViewController = alertVC
        alertWindow.windowLevel = .alert
    }
    
    func showAlertWindow() {
        alertWindow.isHidden = false
        alertWindow.makeKeyAndVisible()
    }
    
    func hideAlertWindow() {
        alertWindow.isHidden = true
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
    }
    
    func showAlert(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
            self.hideAlertWindow()
        }))
        showAlertWindow()
        alertVC.present(alert, animated: true)
    }
}

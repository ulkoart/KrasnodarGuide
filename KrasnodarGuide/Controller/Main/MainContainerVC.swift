//
//  MainContainerVC.swift
//  KrasnodarGuide
//
//  Created by user on 25/05/2021.
//

import UIKit

final class MainContainerVC: UIViewController {
    
    enum SlideOutState {
        case bothCollapsed
        case leftPanelExpanded
    }
    
    var appTabBarController: UITabBarController!
    var currentState: SlideOutState = .bothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .bothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    var leftViewController: SideMenuVC?
    let centerPanelExpandedOffset: CGFloat = 90
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appTabBarController = self.getTabBarController()
        
        guard
            let mainNavigationController = appTabBarController.viewControllers?[TabBarMenu.Main.rawValue] as? UINavigationController,
            let mainVC = mainNavigationController.topViewController as? MainVC
            else { fatalError() }
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        appTabBarController.view.addGestureRecognizer(panGestureRecognizer)
        
        mainVC.delegate = self
        view.addSubview(appTabBarController.view)
        addChild(appTabBarController)
        appTabBarController.didMove(toParent: self)
    }
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
        if shouldShowShadow {
            appTabBarController.view.layer.shadowOpacity = 0.8
        } else {
            appTabBarController.view.layer.shadowOpacity = 0.0
        }
    }
}

// MARK: CenterViewController delegate

extension MainContainerVC: MainVCDelegate {
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelViewController() {
        guard leftViewController == nil else { return }
        
        let vc = SideMenuVC()
        vc.delegate = self
        addChildSidePanelController(vc)
        leftViewController = vc
    }
    
    func addChildSidePanelController(_ sideMenuVC: SideMenuVC) {
        view.insertSubview(sideMenuVC.view, at: 0)
        addChild(sideMenuVC)
        sideMenuVC.didMove(toParent: self)
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(
                targetPosition: appTabBarController.view.frame.width
                    - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { _ in
                self.currentState = .bothCollapsed
                self.leftViewController?.view.removeFromSuperview()
                self.leftViewController = nil
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseInOut,
            animations: {
                self.appTabBarController.view.frame.origin.x = targetPosition
        },
            completion: completion)
    }
    
    func collapseSidePanels() {
    }
}

// MARK: CenterViewController delegate

extension MainContainerVC: MenuDelegate {
    func didSelect(menuItem: MenuModel) {
        print("\(#function) - \(menuItem)")
        if let mainNavigationController = appTabBarController.viewControllers?[TabBarMenu.Main.rawValue] as? UINavigationController {
            let vc = UIViewController()
            vc.view.backgroundColor = .green
            toggleLeftPanel()
            mainNavigationController.pushViewController(vc, animated: true)
        }
        
    }
}

// MARK: Gesture recognizer

extension MainContainerVC: UIGestureRecognizerDelegate {
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
        
        switch recognizer.state {
            
        case .began:
            if currentState == .bothCollapsed && gestureIsDraggingFromLeftToRight {
                addLeftPanelViewController()
                showShadowForCenterViewController(true)
            }
        case .changed:
            if let rview = recognizer.view {
                if !(rview.center.x < view.bounds.size.width / 2) {
                    rview.center.x = rview.center.x + recognizer.translation(in: view).x
                    recognizer.setTranslation(CGPoint.zero, in: view)
                }
            }
        case .ended:
            if let rview = recognizer.view {
                let hasMovedGreaterThanHalfway = rview.center.x > view.bounds.size.width
                animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
            }
        default:
            break
        }
    }
}

// MARK: Others

extension MainContainerVC {
    func getTabBarController() -> UITabBarController? {
        return UIStoryboard(
            name: "Main",
            bundle: Bundle.main
        ).instantiateViewController(withIdentifier: "AppTabBarController") as? UITabBarController
    }
    
}

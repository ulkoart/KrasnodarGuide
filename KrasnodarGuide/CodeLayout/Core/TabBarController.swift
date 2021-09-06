//
//  TabBarController.swift
//  KrasnodarGuide
//

import UIKit

/// Основной таббар
final class TabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		configureTabs()
	}

	/// Настроить вкладки таббара
	private func configureTabs() {

		let mainViewController = createNavigationController(
			viewController: MainViewControllerV2(),
			navigationItemTitle: "Гид Краснодара",
			title: "",
			imageName: "home_custom",
			tag: 0
		)

		let mapViewController = createNavigationController(
			viewController: MapVCV2(),
			navigationItemTitle: "Достопримечательности",
			title: "",
			imageName: "map_custom",
			tag: 1,
			prefersLargeTitles: false
		)

		viewControllers = [mainViewController, mapViewController]
	}

	private func createNavigationController(
		viewController: UIViewController,
		navigationItemTitle: String,
		title: String,
		imageName: String,
		tag: Int,
		prefersLargeTitles: Bool = true
	) -> UIViewController {
		let navigationController = UINavigationController(rootViewController: viewController)
		navigationController.navigationBar.prefersLargeTitles = prefersLargeTitles
		viewController.view.backgroundColor = .white
		viewController.navigationItem.title = navigationItemTitle
		let image = UIImage(named: imageName)
		let tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
		navigationController.tabBarItem = tabBarItem

		return navigationController
	}
}

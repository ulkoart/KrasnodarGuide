//
//  SideMenuViewController.swift
//  KrasnodarGuide
//
//  Created by user on 25/05/2021.
//

import UIKit

protocol MenuDelegate {
    func didSelect(menuItem: MenuModel)
}

enum MenuModel: Int, CustomStringConvertible, CaseIterable {
    case Contacts
    case Settings
    
    var description: String {
        switch self {
        case .Contacts: return "Контакты"
        case .Settings: return "Настройки"

        }
    }
    
    var image: UIImage {
        switch self {
        case .Contacts: return UIImage(named: "Contacts") ?? UIImage()
        case .Settings: return UIImage(named: "Settings") ?? UIImage()

        }
    }
}

final class SideMenuVC: UIViewController {
    
    private var tableView: UITableView!
    var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.reuseId)
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        tableView.backgroundColor = .lightGray
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource delegate

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.reuseId) as! MenuTableCell
        let menuModel = MenuModel(rawValue: indexPath.row)
        cell.iconImageView.image = menuModel?.image
        cell.myLabel.text = menuModel?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuModel.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
}

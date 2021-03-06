//
//  PersonVC.swift
//  KrasnodarGuide
//
//  Created by user on 11.05.2021.
//

import UIKit

final class PersonVC: UIViewController {
    static let identifier = "PersonVC"
    @IBOutlet weak var tableView: UITableView!
    
    private var persons = [Person]()
    var forcePushItemName: String?
    let cellIdentifier: String = "personCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView.tableFooterView = UIView()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(PersonCell.self, forCellReuseIdentifier: cellIdentifier)
        self.loadPersons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let itemName = self.forcePushItemName else { return }
        forcePush(itemName)
    }
    
    private func forcePush(_ itemName: String) {
        let person = persons.filter{ $0.name == itemName }.first
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "PersonDetail") as? PersonDetail else {
                return
        }
        detailVC.person = person
        self.forcePushItemName = nil
        navigationController?.pushViewController(detailVC, animated: false)
        
    }
    
    private func loadPersons() {
        self.persons = Person.getPersons()
        self.tableView.reloadData()
    }

}

extension PersonVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PersonCell else {
            fatalError()
        }
        let person: Person = persons[indexPath.row]
        cell.setup(with: person)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let viewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "PersonDetail") as? PersonDetail
        else { return }
        let person: Person = self.persons[indexPath.row]
        viewController.person = person
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

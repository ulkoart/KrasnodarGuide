//
//  PersonVC.swift
//  KrasnodarGuide
//
//  Created by user on 11.05.2021.
//

import UIKit

final class PersonVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var persons = [Person]()
    
    let cellIdentifier: String = "personCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        self.loadPersons()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PersonTVC else {
            fatalError()
        }
        let person: Person = persons[indexPath.row]
        cell.setup(with: person)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

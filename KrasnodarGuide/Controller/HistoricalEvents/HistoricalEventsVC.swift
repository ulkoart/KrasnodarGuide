//
//  HistoricalEventsVC.swift
//  KrasnodarGuide
//
//  Created by user on 15.05.2021.
//

import UIKit

class HistoricalEventsVC: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    var historicalEvents = [HistoricalEvent]()
    
    let cellIdentifier: String = "historicalEventCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(HistoricalEventCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.historicalEvents = HistoricalEvent.getHistoricalEvents()
        self.tableView.reloadData()
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        tabBarController?.selectedIndex = TabBarMenu.Main.rawValue
    }
    
}

extension HistoricalEventsVC: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historicalEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoricalEventCell
            else { fatalError() }
        cell.setup(with: self.historicalEvents[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let viewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "HistoricalEventsDetail") as? HistoricalEventsDetail
        else { return }
        
        viewController.historicalEvents = historicalEvents[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

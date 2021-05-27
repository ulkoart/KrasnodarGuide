//
//  HistoricalEventsVC.swift
//  KrasnodarGuide
//
//  Created by user on 15.05.2021.
//

import UIKit

final class HistoricalEventsVC: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    static let identifier: String = "HistoricalEventsVC"
    
    var historicalEvents = [HistoricalEvent]()
    let cellIdentifier: String = "historicalEventCell"
    var forcePushItemName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(HistoricalEventCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.historicalEvents = HistoricalEvent.getHistoricalEvents()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let itemName = self.forcePushItemName else { return }
        forcePush(itemName)
    }
    
    private func forcePush(_ itemName: String) {
        let historicalEvent = historicalEvents.filter{ $0.shortTitle == itemName }.first
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "HistoricalEventsDetail") as? HistoricalEventsDetail else {
                return
        }
        detailVC.historicalEvent = historicalEvent
        self.forcePushItemName = nil
        navigationController?.pushViewController(detailVC, animated: true)
        
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
        
        viewController.historicalEvent = historicalEvents[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

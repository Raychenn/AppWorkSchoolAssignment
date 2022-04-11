//
//  ViewController.swift
//  Week4-1
//
//  Created by Boray Chen on 2022/4/11.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    private let tableView = UITableView()
    
    enum CellIdentifier: String {
        case cell
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.cell.rawValue)
    }

    // MARK: - functions
    func configureUI() {

    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.cell.rawValue, for: indexPath)
        
        cell.textLabel?.text = "This is section \(indexPath.section), row \(indexPath.row)"
        
        return cell
    }
}

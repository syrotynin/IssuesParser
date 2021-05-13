//
//  IssuesViewController.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 11.05.2021.
//

import Foundation

import UIKit
import SwiftCSV
import Cartography

class IssuesViewController: UIViewController {
    // MARK: -
    private var tableView: UITableView!
    var dataSource: TableViewDataSource<Issue>?
    
    var viewModel: IssuesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadCSV()
    }
    
    private func configureUI() {
        title = "Issues"
        
        tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        
        constrain(view, tableView) { (view, tableView) in
            tableView.edges == view.edges
        }
        
        IssueTableViewCell.registerNib(in: tableView)
    }
    
    private func loadCSV() {
        viewModel?.update { result in
            switch result {
            case .success(let issues):
                self.dataSource = .make(for: issues)
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
            case .failure(let error):
                let alert = UIAlertController(title: "CSV parsing has failed", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}

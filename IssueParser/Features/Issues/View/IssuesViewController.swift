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
    // MARK: - IBOutlets
    private var tableView: UITableView!
    private var spinner = UIActivityIndicatorView(style: .large)
    
    // MARK: - Dependencies
    var viewModel: IssuesViewModel?
    var dataSource: TableViewDataSource<Issue>?
    
    // MARK: - UI config
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadCSV()
    }
    
    private func configureUI() {
        title = "Issues"
        
        configureTableView()
        configureActivityIndicator()
    }
    
    private func configureTableView() {
        tableView = UITableView()
        view.addSubview(tableView)
        
        constrain(view, tableView) { (view, tableView) in
            tableView.edges == view.edges
        }
        
        // Don't show empty cells
        tableView.tableFooterView = UIView()
        // Register custom cell
        IssueTableViewCell.registerNib(in: tableView)
    }
    
    private func configureActivityIndicator() {
        view.addSubview(spinner)
        
        constrain(view, spinner) { (view, spinner) in
            spinner.center == view.center
        }
    }
    
    // MARK: - CSV Loading
    private func loadCSV() {
        spinner.startAnimating()
        
        viewModel?.loadIssues { [unowned self] result in
            self.spinner.stopAnimating()
            
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

//
//  TableViewDataSource+Issue.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 13.05.2021.
//

import Foundation

extension TableViewDataSource where Model == Issue {
    static func make(for issues: [Issue], reuseIdentifier: String = IssueTableViewCell.identifier) -> TableViewDataSource {
        return TableViewDataSource(
            models: issues,
            reuseIdentifier: reuseIdentifier
        ) { (issue, cell) in
            let issueCell = cell as? IssueTableViewCell
            issueCell?.configure(with: issue)
        }
    }
}

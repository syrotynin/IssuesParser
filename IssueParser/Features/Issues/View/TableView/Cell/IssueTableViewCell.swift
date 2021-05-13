//
//  IssueTableViewCell.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 13.05.2021.
//

import UIKit

class IssueTableViewCell: UITableViewCell, ReusableTableCell {
    // MARK: - IBOutlets
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var surNameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var issueCountLabel: UILabel!
    
    func configure(with model: Issue) {
        firstNameLabel.text = model.firstName
        surNameLabel.text = model.surName
        birthDateLabel.text = DateFormatter.short.string(from: model.birthDate)
        issueCountLabel.text = "\(model.issuesCount) issues"
    }
}

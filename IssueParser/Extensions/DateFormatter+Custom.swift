//
//  DateFormatter+Custom.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 13.05.2021.
//

import Foundation

extension DateFormatter {
    // Date in format 'Jan 2'
    static let short: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()

    // Date in format '1950-11-12T00:00:00'
    static let csv: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
}

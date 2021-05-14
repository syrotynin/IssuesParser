//
//  IssuesViewModel.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 11.05.2021.
//

import Foundation

class IssuesViewModel {
    let issuesLoader = IssuesLoader<Issue>()
    
    func loadIssues(_ completion: @escaping (Result<[Issue], Error>) -> ()) {
        issuesLoader.loadCSV(forResource: "issues", completion: completion)
    }
}

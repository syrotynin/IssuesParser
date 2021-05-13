//
//  IssuesViewModel.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 11.05.2021.
//

import Foundation

class IssuesViewModel {
    var issuesLoader = IssuesLoader<Issue>()
    
    func loadIssues(_ completion: @escaping (Result<[Issue], Error>) -> ()) {
        issuesLoader.loadCSV(forResource: "issues") { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}

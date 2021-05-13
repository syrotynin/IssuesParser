//
//  IssuesViewModel.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 11.05.2021.
//

import Foundation

class IssuesViewModel {
    func update(_ completion: @escaping (Result<[Issue], Error>) -> ()) {
        IssuesLoader().loadCSV(forResource: "issues") { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}

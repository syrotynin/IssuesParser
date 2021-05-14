//
//  Result+Values.swift
//  IssueParserTests
//
//  Created by Serhii Syrotynin on 14.05.2021.
//

import Foundation

extension Result {
    // Returns error if present
    var error: Failure? {
        guard case .failure(let error) = self  else {
            return nil
        }
        return error
    }
    
    // Returns success value if present
    var successValue: Success? {
        guard case .success(let value) = self  else {
            return nil
        }
        return value
    }
}

//
//  Issue.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 11.05.2021.
//

import Foundation

struct Issue {
    let firstName: String
    let surName: String
    let issuesCount: String
    let birthDate: String
}

extension Issue: Decodable {
    private enum CodingKeys: String, CodingKey {
        case firstName = "First name"
        case surName = "Sur name"
        case issuesCount = "Issue count"
        case birthDate = "Date of birth"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decode(String.self, forKey: .firstName)
        surName = try container.decode(String.self, forKey: .surName)
        issuesCount = try container.decode(String.self, forKey: .issuesCount)
        birthDate = try container.decode(String.self, forKey: .birthDate)
    }
}

extension Issue {
    var information: String {
        return "\(firstName) \(surName) - \(issuesCount)"
    }
}

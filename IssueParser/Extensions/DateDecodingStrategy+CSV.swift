//
//  DateDecodingStrategy+CSV.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 13.05.2021.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    static let csvStrategy = custom { decoder throws -> Date in
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = DateFormatter.csv.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}


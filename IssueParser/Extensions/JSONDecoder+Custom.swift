//
//  JSONDecoder+Custom.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 13.05.2021.
//

import Foundation

extension JSONDecoder {
    static let csvDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .csvStrategy
        return decoder
    }()
}

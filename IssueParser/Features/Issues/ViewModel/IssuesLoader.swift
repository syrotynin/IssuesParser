//
//  IssuesLoader.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 11.05.2021.
//

import Foundation
import SwiftCSV

struct IssuesLoader<T: Decodable> {
    
    typealias LoadCompletion = (Result<[T], Error>) -> ()
    
    enum LoadError: Error {
        case fileNotFound
    }
    
    func loadCSV(forResource name: String, bundle: Bundle = .main, completion: @escaping LoadCompletion) {
        DispatchQueue.global(qos: .background).async {
            guard let url = bundle.url(forResource: name, withExtension: ".csv") else {
                completion(.failure(LoadError.fileNotFound))
                return
            }
            
            do {
                let csv = try CSV(url: url)
                print(csv.namedRows) // TODO: Remove
                
                let elements: [T] = csv.namedRows.compactMap { element in
                    guard let json = try? JSONEncoder().encode(element), let decoded = try? JSONDecoder().decode(T.self, from: json) else {
                        return nil
                    }
                    return decoded
                }
                completion(.success(elements))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
}

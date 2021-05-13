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
    
    private let bundle: Bundle
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    private let callbackQueue: DispatchQueue
    
    init(bundle: Bundle = .main,
         decoder: JSONDecoder = .csvDecoder,
         encoder: JSONEncoder = JSONEncoder(),
         callbackQueue: DispatchQueue = .main) {
        self.bundle = bundle
        self.decoder = decoder
        self.encoder = encoder
        self.callbackQueue = callbackQueue
    }
    
    func loadCSV(forResource name: String, completion: @escaping LoadCompletion) {
        DispatchQueue.global(qos: .background).async {
            guard let url = bundle.url(forResource: name, withExtension: ".csv") else {
                callbackQueue.async {
                    completion(.failure(LoadError.fileNotFound))
                }
                return
            }
            
            do {
                let csv = try CSV(url: url)
                print(csv.namedRows) // TODO: Remove
                
                let elements: [T] = csv.namedRows.compactMap { element in
                    guard let json = try? encoder.encode(element), let decoded = try? decoder.decode(T.self, from: json) else {
                        return nil
                    }
                    return decoded
                }
                callbackQueue.async {
                    completion(.success(elements))
                }
            } catch let error {
                callbackQueue.async {
                    completion(.failure(error))
                }
            }
        }
    }
}

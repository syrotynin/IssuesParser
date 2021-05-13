//
//  Configurable.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/24/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

protocol Configurable {
	associatedtype Model
	func configure(with model: Model)
}

protocol ConfigurableCell: Configurable where Self: UITableViewCell {}

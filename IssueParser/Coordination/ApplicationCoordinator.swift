//
//  ApplicationCoordinator.swift
//  TableManagement
//
//  Created by Serhii Syrotynin on 6/20/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
	let window: UIWindow
	let rootViewController: UINavigationController
	var issuesCoordinator: IssuesCoordinator?

	init(window: UIWindow) {
		self.window = window
		rootViewController = UINavigationController()
		rootViewController.navigationBar.prefersLargeTitles = true
	}

	func start() {
		window.rootViewController = rootViewController
		window.makeKeyAndVisible()

		let issuesCoordinator = IssuesCoordinator(presenter: rootViewController)
		self.issuesCoordinator = issuesCoordinator
        issuesCoordinator.start()
	}
}

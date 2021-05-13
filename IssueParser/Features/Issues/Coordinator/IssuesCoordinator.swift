//
//  IssuesCoordinator.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 11.05.2021.
//

import UIKit

class IssuesCoordinator: Coordinator {
    private let presenter: UINavigationController
    var controller: IssuesViewController?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let controller = IssuesViewController()
        controller.viewModel = IssuesViewModel()
        self.controller = controller
        presenter.pushViewController(controller, animated: true)
    }
}

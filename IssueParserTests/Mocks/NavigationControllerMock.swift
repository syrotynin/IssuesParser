//
//  NavigationControllerMock.swift
//  IssueParserTests
//
//  Created by Serhii Syrotynin on 13.05.2021.
//

import UIKit

class NavigationControllerMock: UINavigationController {
    var pushViewControllerCalled = false
    var pushViewControllerInputViewController: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        pushViewControllerCalled = true
        pushViewControllerInputViewController = viewController
        super.pushViewController(viewController, animated: false)
    }
}

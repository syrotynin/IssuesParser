//
//  IssuesCoordinatorTests.swift
//  IssueParserTests
//
//  Created by Serhii Syrotynin on 13.05.2021.
//

import XCTest
@testable import IssueParser

class IssuesCoordinatorTests: XCTestCase {
    func test_start_issueViewController_presented() {
        let navigationController = NavigationControllerMock()
        let sut = IssuesCoordinator(presenter: navigationController)
        
        sut.start()
        
        XCTAssert(navigationController.pushViewControllerCalled)
        XCTAssert(navigationController.pushViewControllerInputViewController is IssuesViewController)
    }
}

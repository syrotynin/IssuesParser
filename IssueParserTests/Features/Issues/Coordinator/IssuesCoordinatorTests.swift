//
//  IssuesCoordinatorTests.swift
//  IssueParserTests
//
//  Created by Serhii Syrotynin on 13.05.2021.
//

import XCTest
@testable import IssueParser

class IssuesCoordinatorTests: XCTestCase {
    
    func test_start_issueViewController_isPresented() {
        // Given
        let navigationController = NavigationControllerMock()
        let sut = IssuesCoordinator(presenter: navigationController)
        
        // When
        sut.start()
        
        // Then
        XCTAssert(navigationController.pushViewControllerCalled)
        XCTAssert(navigationController.pushViewControllerInputViewController is IssuesViewController)
    }
}

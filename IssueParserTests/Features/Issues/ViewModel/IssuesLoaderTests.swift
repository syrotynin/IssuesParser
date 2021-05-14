//
//  IssuesLoaderTests.swift
//  IssueParserTests
//
//  Created by Serhii Syrotynin on 14.05.2021.
//

import XCTest
@testable import IssueParser

class IssuesLoaderTests: XCTestCase {
    
    let notExistingCSV = "issues"
    let existingCSV = "issues_test"
    let brokenCSV = "issues_test_broken"
    let heavyCSV = "issues_test_heavy"
    
    func test_loadCSV_returnsFileNotFoundError() {
        // Given
        let sut = IssuesLoader<Issue>(bundle: Bundle(for: type(of: self)))
        var result: Result<[Issue], Error>?
        
        // When
        let expectation = self.expectation(description: #function)
        sut.loadCSV(forResource: notExistingCSV) {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        guard let error = result?.error as? IssuesLoader<Issue>.LoadError else {
            XCTFail("There must be a loading error")
            return
        }
        
        XCTAssertEqual(error, IssuesLoader<Issue>.LoadError.fileNotFound)
    }
    
    func test_loadCSV_returnsIssues() {
        // Given
        let sut = IssuesLoader<Issue>(bundle: Bundle(for: type(of: self)))
        var result: Result<[Issue], Error>?
        
        // When
        let expectation = self.expectation(description: #function)
        sut.loadCSV(forResource: existingCSV) {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(result?.successValue?.count, 3)
        XCTAssertEqual(result?.successValue?.first?.firstName, "Theo")
        XCTAssertEqual(result?.successValue?.first?.surName, "Jansen")
        XCTAssertEqual(result?.successValue?.first?.issuesCount, 5)
    }
    
    func test_loadCSV_withBrokenRows_returnsCorrectIssues() {
        // Given
        let sut = IssuesLoader<Issue>(bundle: Bundle(for: type(of: self)))
        var result: Result<[Issue], Error>?
        
        // When
        let expectation = self.expectation(description: #function)
        sut.loadCSV(forResource: brokenCSV) {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(result?.successValue?.count, 1)
        XCTAssertEqual(result?.successValue?.first?.firstName, "Fiona")
        XCTAssertEqual(result?.successValue?.first?.surName, "de Vries")
        XCTAssertEqual(result?.successValue?.first?.issuesCount, 0)
    }
    
    func test_loadCSV_withLotsOfRows_returnsIssues() {
        // Given
        let sut = IssuesLoader<Issue>(bundle: Bundle(for: type(of: self)))
        var result: Result<[Issue], Error>?
        
        // When
        let expectation = self.expectation(description: #function)
        sut.loadCSV(forResource: heavyCSV) {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 30)
        
        XCTAssertEqual(result?.successValue?.count, 27000)
        XCTAssertEqual(result?.successValue?.first?.firstName, "Theo")
        XCTAssertEqual(result?.successValue?.first?.surName, "Jansen")
        XCTAssertEqual(result?.successValue?.first?.issuesCount, 5)
    }
    
    func test_loadCSV_withWrongModel_returnsEmptySuccess() {
        // Given
        let sut = IssuesLoader<String>(bundle: Bundle(for: type(of: self)))
        var result: Result<[String], Error>?
        
        // When
        let expectation = self.expectation(description: #function)
        sut.loadCSV(forResource: existingCSV) {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(result?.successValue?.count, 0)
    }
}

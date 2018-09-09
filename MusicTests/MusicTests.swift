//
//  MusicTests.swift
//  MusicTests
//
//  Created by Sandeep on 06/09/2018.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import XCTest
@testable import Music

class MusicTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPresenterWithEmptyCategoryName(){
        let expec = expectation(description: "empty category text")
        let presenter = MusicPresenter(delegate: MockUIViewController(expectation: expec))
        presenter.check(categoryText: "")
        wait(for: [expec], timeout: 3)
    }
    func testFetchedData(){
        let expec = expectation(description: "server returns null")
        let presenter = MusicPresenter(delegate: MockUIViewController(expectation: expec))
        presenter.fetchData(category: "Track", categoryText: "its my life")
        //wait(for: [expec], timeout: 10)
    }
}

class MockUIViewController: MusicDelegate{
    func showData() {
    }
    
    func checkServerResultFailed(message: String) {
    }
    
    func selectCategory(category: String) {
    }
    
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func checkCategoryDidFailed(message: String){
        XCTAssertEqual(message, "category text can't be blank")
        self.expec.fulfill()
    }
}

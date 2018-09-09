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
    func testAlbumFetchedData(){
        let expec = expectation(description: "server call")
        //let presenter = MusicPresenter(delegate: MockUIViewController(expectation: expec))
        let categoryText = "sss"
        let category = "album"
        let API_KEY = "&api_key=b92e88e20d14802cea3f032878724189"
        let mainUrl = "http://ws.audioscrobbler.com/2.0/?method="
        let encodedCategoryText = categoryText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let searchLink = category + ".search"
        let url:String = mainUrl + searchLink + "&" + category + "=" + encodedCategoryText! + API_KEY+"&format=json"
        
        URLSession.shared.dataTask(with:URLRequest(url: URL(string: url)!), completionHandler: {(data, response, error) in
            
            do {
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    
                XCTAssertTrue(response.statusCode == 200, "statusCode is matching the server data")
                }
                else{
                    XCTFail()
                }
                expec.fulfill()
            }
        }).resume()
        wait(for: [expec], timeout: 30)
}
}
class MockUIViewController: MusicDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showData() {
    }
    
    func checkServerResultFailed(message: String) {
    }
    
    func selectCategory(category: String) {
    }
    
    func checkCategoryDidFailed(message: String){
        XCTAssertEqual(message, "category text can't be blank")
        self.expec.fulfill()
    }
}

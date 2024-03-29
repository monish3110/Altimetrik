//
//  AltimetrikTests.swift
//  AltimetrikTests
//
//  Created by Monish M on 06/03/24.
//

import XCTest
@testable import Altimetrik

final class AltimetrikTests: XCTestCase {
    
    let networkManager = NetworkManager.shared
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //Check the api return data
    func getPostsData_test() async throws {
        
        do {
            let postData = try await networkManager.mockFetchPostData(filename: "MockPostsData")
            XCTAssertNotNil(postData)
            
            XCTAssertEqual(postData.first?.id, "1")
            XCTAssertTrue(postData.count == 5)
        }
        catch {
            XCTFail("Error in fetching data: \(error)")
        }
    }
    
    //Check date format returns correct format
    func toDisplayDateFormat_test() {
        let data = "2022-10-11T07:23:12Z"
        let expectedData = "Oct 11 2022 12:53 PM"
        
        XCTAssertEqual(data.toDisplayDateFormat, expectedData)
    }
}

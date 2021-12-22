//
//  APITests.swift
//  AstronautsTests
//
//  Created by M_Sanjay on 22/12/2021.
//

import XCTest

@testable import Astronauts

final class AsyncAPITests: XCTestCase {
    var apiHelper : APIServiceProtocol?
    
    override func setUpWithError() throws {
        apiHelper = APIHelper.shared
    }

    override func tearDownWithError() throws {
        apiHelper = nil
    }
    
    func test_No_Server_Response() throws {
        let expectation = self.expectation(description: "Server Response")
        defer {waitForExpectations(timeout: 3)}
        apiHelper?.fetchAstronauts(url: URL(string: Constants.API.baseURL+"abc")!, completion: { result in
            switch result {
            case .success(_):
                XCTFail("Expected No Response from Server")
            case .failure(let error):
               XCTAssertNotNil(error, "Error should not be nil as the base url is modified")
            }
            
            expectation.fulfill()
        })
    }
    
    func test_Valid_Server_Response() throws {
        let expectation = self.expectation(description: "Server Response")
        defer {waitForExpectations(timeout: 3)}
        apiHelper?.fetchAstronauts(url: URL(string: Constants.API.baseURL)!, completion: { result in
            switch result {
            case .success(let astronautsData):
                XCTAssertNotNil(astronautsData, "Unable to fetch Astronauts data")
            case .failure(let error):
               XCTAssertNil(error, "Error should be nil")
            }
            
            expectation.fulfill()
        })
    }
    
   
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

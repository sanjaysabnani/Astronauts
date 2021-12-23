//
//  MockAPITests.swift
//  AstronautsTests
//
//  Created by M_Sanjay on 22/12/2021.
//

import XCTest
@testable import Astronauts

final class MockAPITests: XCTestCase {
    var mockAPIWithError : APIServiceProtocol?
    var mockAPI : APIServiceProtocol?
    override func setUpWithError() throws {
        mockAPIWithError = MockAPIHelper(shouldThrowError: true)
        mockAPI = MockAPIHelper(shouldThrowError: false)
    }

    override func tearDownWithError() throws {
        mockAPIWithError = nil
        mockAPI = nil
    }

    func test_MockAPIError() throws {
        let expectation = self.expectation(description: "Server Response")
        defer {waitForExpectations(timeout: 3)}
        
        mockAPIWithError?.fetchProfileImage(imageUrl: URL(string:"abc"),completion: { result  in
                defer { expectation.fulfill() }
                switch result {
                case .success(_):
                    XCTFail("MockAPI should throw error")
                case .failure(let error):
                    XCTAssertNotNil(error, "Mock API Error should not be nil.")
                }
        })
    }
    
                                            
    func test_MockAPIDecoding() throws  {
        
        let expectation = self.expectation(description: "Server Response")
        defer {waitForExpectations(timeout: 3)}
        
        mockAPI?.fetchAstronauts(url: URL(string: Constants.API.baseURL)!) { result in
            defer { expectation.fulfill() }
            switch result {
            case .success(let astronautsData):
                XCTAssertNotNil(astronautsData, "Mock API Error should decode AstronautsData")

            case .failure(_):
                XCTFail("MockAPI should not throw error")

            }
        }
    }
    
    func test_MockAPIAstronaut() throws  {
        
        let expectation = self.expectation(description: "Server Response")
        defer {waitForExpectations(timeout: 3)}
        
        mockAPI?.fetchAstronauts(url: URL(string: Constants.API.baseURL)!) { result in
            defer { expectation.fulfill() }
            switch result {
            case .success(let astronautsData):
                XCTAssertNotNil(astronautsData, "Mock API Error should decode AstronautsData")

            case .failure(_):
                XCTFail("MockAPI should not throw error")

            }
        }
    }


}

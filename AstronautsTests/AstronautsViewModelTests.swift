//
//  AstronautsTests.swift
//  AstronautsTests
//
//  Created by M_Sanjay on 20/12/2021.
//

import XCTest
@testable import Astronauts

class AstronautsViewModelTests: XCTestCase {

    var mockAPI : APIServiceProtocol?
    var astronatutsViewModel : AstronautsViewModel?
    override func setUpWithError() throws {
        mockAPI = MockAPIHelper(shouldThrowError: false)
        astronatutsViewModel = AstronautsViewModel(apiServiceProtocol: mockAPI!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSort() throws {
        
        mockAPI?.fetchAstronauts(url: URL(string: Constants.API.baseURL)!) { result in
            switch result {
            case .success(let astronautsData):
               let astronauts = astronautsData.results
                let sortedAstronauts =  self.astronatutsViewModel?.sort(astronauts: astronauts, ascending: true)
                let sortedArray = astronauts.sorted(by: {$0.name < $1.name})
                XCTAssertEqual(sortedAstronauts?.first?.name , sortedArray.first?.name)
                XCTAssertEqual(sortedAstronauts?.last?.name, sortedArray.last?.name)
                
                
            case .failure(_):
                XCTFail("MockAPI should not throw error")

            }
    }

    

}
}

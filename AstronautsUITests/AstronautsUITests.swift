//
//  AstronautsUITests.swift
//  AstronautsUITests
//
//  Created by M_Sanjay on 20/12/2021.
//

import XCTest

class AstronautsUITests: XCTestCase {
    
    var app : XCUIApplication!
    override func setUpWithError() throws {
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }


    func testNavigationBacktoAstronautsScreen() throws {
        
        let astronautsNavigationBar = app.navigationBars["Astronauts"]
        let sortButton = astronautsNavigationBar.buttons["sort"]
        XCTAssertTrue(sortButton.exists)
        app.tables.cells.containing(.staticText, identifier:"Roberta Bondar").element.tap()
        XCTAssertFalse(sortButton.exists)
        astronautsNavigationBar.buttons["Astronauts"].tap()
        XCTAssertTrue(sortButton.exists)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

     
}

//
//  LocationCheckWithVaporStub.swift
//  Vapor-XCTestUITests
//
//  Created by Shashikant Jagtap on 02/03/2018.
//  Copyright © 2018 Shashikant Jagtap. All rights reserved.
//

import XCTest

class LocationCheckWithVaporStub: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocationWithVaporStub() {
        let app = XCUIApplication()
        app.launchEnvironment = ["BASEURL" : "http://localhost:8080"]
        app.launch()
        let gtusernametextfieldTextField = app.textFields["gtUserNameTextField"]
        gtusernametextfieldTextField.tap()
        gtusernametextfieldTextField.typeText("Shashikant86")
        app.buttons["ShowButton"].tap()
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: app.staticTexts["StubName"], handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(app.staticTexts["StubName"].exists)
        XCTAssert(app.staticTexts["StubLocation"].exists)
        XCTAssert(app.staticTexts["1000"].exists)
        XCTAssert(app.staticTexts["100"].exists)
        
    }
}

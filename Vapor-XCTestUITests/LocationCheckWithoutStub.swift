//
//  Vapor_XCTestUITests.swift
//  Vapor-XCTestUITests
//
//  Created by Shashikant Jagtap on 02/03/2018.
//  Copyright © 2018 Shashikant Jagtap. All rights reserved.
//

import XCTest

class LocationCheckWithoutStub: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocationWithoutStub() {
        let app = XCUIApplication()
        app.launchEnvironment = ["BASEURL" : "https://api.github.com"]
        app.launch()
        let gtusernametextfieldTextField = app.textFields["gtUserNameTextField"]
        gtusernametextfieldTextField.tap()
        gtusernametextfieldTextField.typeText("Shashikant86")
        app.buttons["ShowButton"].tap()
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: app.staticTexts["London"], handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(app.staticTexts["London"].exists)
    }
    
}

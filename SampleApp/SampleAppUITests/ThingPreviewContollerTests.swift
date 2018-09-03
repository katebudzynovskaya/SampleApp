//
//  ThingPreviewContollerTests.swift
//  SampleAppUITests
//
//  Created by Kate on 9/3/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import XCTest

class ThingPreviewContollerTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        let app = XCUIApplication()
        app.launch()
        
        let thingsList = app.tables["things.list"]
        let cell = thingsList.cells.containing(.cell, identifier: "2")
        let thumbnail = cell.images["things.thumbnail"]
        thumbnail.tap()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSourcePreviewSaving() {
        
        let app = XCUIApplication()
        
        let thingPreviewElement = app.otherElements["thing.preview"]
        thingPreviewElement/*@START_MENU_TOKEN@*/.press(forDuration: 1.9);/*[[".tap()",".press(forDuration: 1.9);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        app.sheets["Save to Photo Library"].buttons["Save"].tap()
        app.alerts["Saved"].buttons["OK"].tap()
    }
    
}

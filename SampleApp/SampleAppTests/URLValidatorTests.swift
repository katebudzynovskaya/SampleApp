//
//  URLValidatorTests.swift
//  SampleAppTests
//
//  Created by Kate on 9/1/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import XCTest
@testable import SampleApp

class URLValidatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmptyStringURL() {
        
        let actual = URLValidator.isURL(url: "")
        
        XCTAssertFalse(actual)
    }
    
    func testNonURLString () {
        
        let actual = URLValidator.isURL(url: "default")
        
        XCTAssertFalse(actual)
    }
    
    func testValidURL () {
        
        let actual = URLValidator.isURL(url: "https://google.com")
        
        XCTAssertTrue(actual)
    }
    
    func testValidURLWithTypo () {
        
        let actual = URLValidator.isURL(url: "https:/google.com")
        
        XCTAssertFalse(actual)
    }
}

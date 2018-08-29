//
//  IntFormattingTests.swift
//  SampleAppTests
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import XCTest

@testable import SampleApp

class IntFormattingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNotNilResult() {
        
        let actual = 23.shortendFormat()
        XCTAssertNotNil(actual)
    }
    
    func testShortendFormatDecimalNumber() {
        
        let expected = "33"
        let actual = 33.shortendFormat()
        
        XCTAssertEqual(actual, expected)
        
    }
    
    func testShortendFormatHundreds() {
        
        let expected = "333"
        let actual = 333.shortendFormat()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testShortendFormatThousands() {
        
        let expected = "2k"
        let actual = 2_030.shortendFormat()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testShortendFormatFloatThousands() {
        
        let expected = "3.6k"
        let actual = 3_565.shortendFormat()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testShortendIntForIntMillions() {
        
        let expected = "5M"
        let actual = 5_000_000.shortendFormat()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testShortendIntForFloatMillions() {
        
        let expected = "1.6M"
        let actual = 1_589_000.shortendFormat()
        
        XCTAssertEqual(actual, expected)
    }
}

//
//  DateTimeAgoFormattingTests.swift
//  SampleAppTests
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import XCTest
@testable import SampleApp

class DateTimeAgoFormattingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNotNilResult() {
    
        let arbitraryTimeInterval: Double = 345
        let arbitraryAgoDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - arbitraryTimeInterval)
        let actual = arbitraryAgoDate.timeAgo()
        
        XCTAssertNotNil(actual)
    
    }
    
    func testTimeAgoSeconds() {
        
        let expected = "33s ago"
        
        let secondsAgoTimeInterval: Double = 33
        let secondsAgoDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - secondsAgoTimeInterval)
        let actual = secondsAgoDate.timeAgo()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testTimeAgoMinutes() {
        
        let expected = "43m ago"
        
        let minutesAgoTimeInterval: Double = 60 * 43
        let minutesAgoDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - minutesAgoTimeInterval)
        let actual = minutesAgoDate.timeAgo()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testTimeAgoHours() {
        
        let expected = "13h ago"
        
        let hoursAgoTimeInterval: Double = 60 * 60 * 13
        let hourseAgoDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - hoursAgoTimeInterval)
        let actual = hourseAgoDate.timeAgo()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testTimeAgoDays() {
        
        let expected = "3d ago"
        
        let daysAgoTimeInterval: Double = 60 * 60 * 24 * 3
        let daysAgoDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - daysAgoTimeInterval)
        let actual = daysAgoDate.timeAgo()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testTimeAgoYears() {
        
        let expected = "5y ago"
        
        let yearsAgoTimeInterval: Double = 60 * 60 * 24 * 365 * 5
        let yearsAgoDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - yearsAgoTimeInterval)
        let actual = yearsAgoDate.timeAgo()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testTresholdTimeInterval() {
        
        let expected = "1m ago"
        
        let secondsAgoTimeInterval: Double = 60
        let secondsAgoDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - secondsAgoTimeInterval)
        let actual = secondsAgoDate.timeAgo()
        
        XCTAssertEqual(actual, expected)
    }
    
    func testTimeAgoForDateInFuture() {
        
        let expected = ""
        
        let twoHoursTimeInterval: Double = 60 * 60 * 2
        let twoHoursAheadDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970 + twoHoursTimeInterval)
        let actual = twoHoursAheadDate.timeAgo()
        
        XCTAssertEqual(actual, expected)
        
    }
}

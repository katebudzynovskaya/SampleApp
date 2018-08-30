//
//  URLBuilderTests.swift
//  SampleAppTests
//
//  Created by Kate on 8/30/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import XCTest
@testable import SampleApp

class URLBuilderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testURLOnlyWithHost() {
        
        let expectedURL = URL(string: "https://google.com")

        let actualURL = URLBuilder.url(host: "google.com")
        
        XCTAssertEqual(actualURL, expectedURL)
    }
    
    func testURLWithEndpoint() {
        
        let expectedURL = URL(string: "https://www.reddit.com/top.json")
        
        let actualURL = URLBuilder.url(host: "www.reddit.com", endpoint: "/top.json")
        
        XCTAssertEqual(actualURL, expectedURL)
    }
    
    func testURLWithParameters() {
        
        let expectedURL = URL(string: "https://www.reddit.com/top.json?limit=10&count=1")
        
        let actualURL = URLBuilder.url(host: "www.reddit.com", endpoint: "/top.json", parameters: ["limit" : "10", "count" : "1"])
        
        XCTAssertEqual(actualURL, expectedURL)
    }
    
    func testURLWithInvalidEndpoint() {
        
        let actualURL = URLBuilder.url(host: "www.reddit.com", endpoint: "top.json")
        
        XCTAssertNil(actualURL)
    }
}

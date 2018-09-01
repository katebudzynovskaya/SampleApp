//
//  ImageCacheTests.swift
//  SampleAppTests
//
//  Created by Kate on 9/1/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import XCTest
@testable import SampleApp

class ImageCacheTests: XCTestCase {
    
    var cache: MockImageCache!
    var bundle: Bundle!
    var cachedImage: UIImage!
    
    override func setUp() {
        super.setUp()
        
        let api = MockAPIService()
        cache = MockImageCache(service: api)
        bundle = Bundle(for: type(of: self))
        cachedImage = UIImage(named: "mock", in: bundle, compatibleWith: nil)
        
        let data = UIImagePNGRepresentation(cachedImage)
        let purgeableData = NSPurgeableData(data: data!)
        cache.cache.setObject(purgeableData, forKey: "mock")
        purgeableData.endContentAccess()
    }
    
    override func tearDown() {
        
        cache = nil
        super.tearDown()
    }
    
    func testHasCachedImage()  {
    
        let actual = cache.hasCachedImage(url: "mock")
        
        XCTAssertTrue(actual)
    }
    
    func testHasNoCachedImage() {
        
        let actual = cache.hasCachedImage(url: "none")
        
        XCTAssertFalse(actual)
    }
    
    func testThatRetrievedCachedImageNotNil() {
        
        let placeholder: UIImage! = UIImage(named:"placeholder", in: bundle, compatibleWith: nil)
        let actual = cache.cachedImage(url: "mock", placeholder: placeholder)
        
        XCTAssertNotNil(actual)
    }
    
    func testThatRetrievedCachedImageIsNotPlaceholder() {
        
        let placeholder: UIImage! = UIImage(named:"placeholder", in: bundle, compatibleWith: nil)
        let actual = cache.cachedImage(url: "mock", placeholder: placeholder)
        
        XCTAssertNotEqual(placeholder, actual)
    }
    
    func testThatForNotCachedImagePlaceholderReturned() {
        
        let placeholder: UIImage! = UIImage(named:"placeholder", in: bundle, compatibleWith: nil)
        let actual = cache.cachedImage(url: "none", placeholder: placeholder)
        
        XCTAssertEqual(placeholder, actual)
    }
    
    func testThatRetrievedCachedImageIsSame() {
        
        let placeholder: UIImage! = UIImage(named:"placeholder", in: bundle, compatibleWith: nil)
        let actual = cache.cachedImage(url: "mock", placeholder: placeholder)
        
        let cachedImageData = UIImagePNGRepresentation(cachedImage)
        let actualImageData = UIImagePNGRepresentation(actual)
        
        XCTAssertEqual(actualImageData, cachedImageData)
    }
    
    func testThatDownloadedValidImageIsCached() {
        
        cache.image(url: MockImageURL.valid.rawValue, success: { (image) in }) { (error) in }
        
        let actual = cache.hasCachedImage(url: MockImageURL.valid.rawValue)
        XCTAssertTrue(actual)
    }
    
    func testClearCache() {
        
        cache.clearCache()
        
        let actual = cache.hasCachedImage(url: "mock")
        
        XCTAssertFalse(actual)
        
    }
}

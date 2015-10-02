//
//  taskTests.swift
//  taskTests
//
//  Created by Jhonathan Wyterlin on 01/10/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

import XCTest
@testable import task

class taskTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetShowsPopular() {
        
        sleep(1);
        
        var waitingForBlock:Bool = true
        
        let showDAO = ShowDAO()
        
        showDAO.showsPopularWithCompletion({ (shows, hasNoConnection, error ) -> Void in
            
            waitingForBlock = false
            
        }) { (response, error) -> Void in
            
            print(response)
            
            if ( response == nil ) {
                XCTFail("response is empty")
                return;
            }

            let list:NSArray = response as! NSArray!
            
            for ( var i = 0; i < list.count; i++ ) {

                if let element:NSDictionary = list.objectAtIndex(i) as? NSDictionary {
                    
                    XCTAssert( ( element["title"] as! NSString ).length > 0, "No title at index \(i)")
                    XCTAssert( ( element["year"] as! NSNumber ).intValue > 0, "No year at index \(i)")
                    
                    if let ids:NSDictionary = element["ids"] as? NSDictionary {
                        
                        if let trakt:NSNumber = ids["trakt"] as? NSNumber {
                            XCTAssert( trakt.intValue > 0, "Trakt with zero at index \(i)")
                        } else {
                            XCTFail("No trakt at index \(i)")
                        }
                        
                        if let slug:NSString = ids["slug"] as? NSString {
                            XCTAssert( slug.length > 0, "slug is empty at index \(i)" )
                        } else {
                            XCTFail("No slug at index \(i)")
                        }
                        
                        if let tvdb:NSNumber = ids["tvdb"] as? NSNumber {
                            XCTAssert( tvdb.intValue > 0, "tvdb with zero at index \(i)")
                        } else {
                            XCTFail("No tvdb at index \(i)")
                        }
                        
                        if let imdb:NSString = ids["imdb"] as? NSString {
                            XCTAssert( imdb.length > 0, "imdb is empty at index \(i)" )
                        } else {
                            XCTFail("No imdb at index \(i)")
                        }
                        
                        if let tmdb:NSNumber = ids["tmdb"] as? NSNumber {
                            XCTAssert( tmdb.intValue > 0, "tmdb with zero at index \(i)")
                        } else {
                            XCTFail("No tmdb at index \(i)")
                        }
                        
                        if let tvrage:NSNumber = ids["tvrage"] as? NSNumber {
                            XCTAssert( tvrage.intValue > 0, "tvrage with zero at index \(i)")
                        } else {
                            XCTFail("No tvrage at index \(i)")
                        }
                        
                    } else {
                        XCTFail("No ids at index \(i)")
                    }
                    
                } else {
                    
                    XCTFail("element is empty at index \(i)")
                    
                }
                
                
            }
            
        }
        
        repeat {
            while( waitingForBlock == true ) {
                NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate.init( timeIntervalSinceNow: 0.1 ) )
            }
        } while ( false )
    
    }
    
}

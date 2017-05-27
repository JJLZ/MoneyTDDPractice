//
//  WadTests.swift
//  Money
//
//  Created by JJLZ on 5/27/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import XCTest
@testable import Money

class WadTests: XCTestCase {
    
    let emptyWad: Wad = Wad()
    let singleBillWad = Wad(amount: 42, currency: "USD")
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCanCreateWad()
    {
        let wad = Wad(amount: 0, currency: "EUR")
        
        XCTAssertNotNil(wad)
    }
    
    func testEquality()
    {
    }
    
//    func testSimpleMultiplication()
//    {
//        let ten = five.times(2)
//        
//        XCTAssertEqual(ten.amount, 10)
//    }
//    
//
//    func testThatObjectWithEqualHashAreEqual()
//    {
//        XCTAssertEqual(five.hashValue, five2.hashValue)
//    }
//    
//    func testSimpeAddition()
//    {
//        let otherFive = Wad(amount: 5, currency: "EUR")
//        
//        XCTAssertEqual(ten, five.plus(otherFive))
//    }
//    
//    func testSimpeReduction()
//    {
//        let broker = Broker()
//        
//        XCTAssertEqual(try! five.reduced(to:"EUR", broker: broker), five)
//    }
    
}

//
//  MoneyTests.swift
//  MoneyTests
//
//  Created by JJLZ on 5/24/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import XCTest

@testable import Money

class MoneyTests: XCTestCase {
    
    let five = Bill(amount: 5, currency: "EUR")
    let five2 = Bill(amount: 5, currency: "EUR")
    let ten = Bill(amount: 10, currency: "EUR")
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        
        super.tearDown()
    }
    
    func testCanCreateEuro()
    {
        let euro = Bill(amount: 0, currency: "EUR")
        
        XCTAssertNotNil(euro)
    }
    
    func testSimpleMultiplication()
    {
        let ten = five.times(2)
        
        XCTAssertEqual(ten.amount, 10)
    }
    
    func testEquality()
    {
        XCTAssertEqual(five, five)
        XCTAssertEqual(five, five2)
        XCTAssertNotEqual(five, ten)
    }
    
    func testThatObjectWithEqualHashAreEqual()
    {
        XCTAssertEqual(five.hashValue, five2.hashValue)
    }
    
    func testSimpeAddition()
    {
        let otherFive = Bill(amount: 5, currency: "EUR")
        
        XCTAssertEqual(ten, five.plus(otherFive))
    }
    
    func testSimpeReduction()
    {
        let broker = Broker()
        
        XCTAssertEqual(try! five.reduced(to:"EUR", broker: broker), five)
    }
}






























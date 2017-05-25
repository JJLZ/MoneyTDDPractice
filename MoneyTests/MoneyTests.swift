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
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        
        super.tearDown()
    }
    
    func testCanCreateEuro()
    {
        let euro = Money(amount: 0, currency: "€")
        
        XCTAssertNotNil(euro)
    }
    
    func testSimpleMultiplication()
    {
        let five = Money(amount: 5, currency: "€")
        let ten = five.times(2)
        
        XCTAssertEqual(ten.amount, 10)
    }
    
    func testEquality()
    {
        let five = Money(amount: 5, currency: "€")
        let five2 = Money(amount: 5, currency: "€")
        let ten = Money(amount: 10, currency: "€")
        
        XCTAssertEqual(five, five)
        XCTAssertEqual(five, five2)
        XCTAssertNotEqual(five, ten)
    }
    
    func testThatObjectWithEqualHashAreEqual()
    {
        let five = Money(amount: 5, currency: "€")
        let five2 = Money(amount: 5, currency: "€")
        
        XCTAssertEqual(five.hashValue, five2.hashValue)
    }
    
    func testSimpeAddition()
    {
        let five = Money(amount: 5, currency: "€")
        let otherFive = Money(amount: 5, currency: "€")
        let ten = Money(amount: 10, currency: "€")
        
        XCTAssertEqual(ten, five.plus(otherFive))
    }
}






























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
        // identity
        XCTAssertEqual(emptyWad, emptyWad)
        XCTAssertEqual(singleBillWad, singleBillWad)
        
        XCTAssertNotEqual(emptyWad, singleBillWad)
        
        // equivalence
        let tenEuros = Wad(amount: 10, currency: "EUR")
        let tenDollars = Wad(amount: 10, currency: "USD")
        
        let fifty1 = Wad(amount: 50, currency: "USD")
        let fifty2 = Wad(amount: 10, currency: "EUR").plus(tenEuros).plus(tenDollars).plus(tenDollars).plus(tenEuros)
        let fifty3 = Wad(amount: 30, currency: "EUR").plus(tenDollars).plus(tenEuros)
        
        XCTAssertEqual(fifty1, fifty2)
        XCTAssertEqual(fifty1, fifty3)
        XCTAssertEqual(fifty2, fifty3)
        
//        print("\(emptyWad)")
//        print("\(singleBillWad)")
//        print("\(tenEuros)")
//        print("\(tenDollars)")
//        print("\(fifty1)")
//        print("\(fifty2)")
//        print("\(fifty3)")
    }
    
    func testSimpleAddition()
    {
        XCTAssertEqual(singleBillWad.plus(Wad(amount:8, currency:"USD")), Wad(amount:50, currency:"USD"))
    }
    
    func testSimpleMultiplication()
    {
        let eightyFour = singleBillWad.times(2)
        
        XCTAssertEqual(eightyFour, Wad(amount: 84, currency: "USD"))
        
//        print("\(eightyFour)")
//        print("\(Wad(amount: 84, currency: "USD"))")
    }
}































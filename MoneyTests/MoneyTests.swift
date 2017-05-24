//
//  MoneyTests.swift
//  MoneyTests
//
//  Created by JJLZ on 5/24/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

//Algunos de los hechos que el cliente quiere poder representar en el sistema son los siguientes:
//
//1. €10+€5=€15
//2. $12*2=$24
//3. $20 + €5 = $30, suponiendo una tasa de conversión 2:1
//
//El objetivo de la práctica es llegar a poder representar (3), haciendo todos los tests por el camino.

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
        let euro = Euro(amount: 0)
        
        XCTAssertNotNil(euro)
    }
    
    func testSimpleMultiplication()
    {
        let five = Euro(amount: 5)
        let ten = five.times(2)
        
        XCTAssertEqual(ten.amount, 10)
    }
    
    func testEquality()
    {
        let five = Euro(amount: 5)
        let five2 = Euro(amount: 5)
        let ten = Euro(amount: 10)
        
        XCTAssertEqual(five, five)
        XCTAssertEqual(five, five2)

        XCTAssertNotEqual(five, ten)
    }
}






























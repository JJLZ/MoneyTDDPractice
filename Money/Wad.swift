//
//  Wad.swift
//  Money
//
//  Created by JJLZ on 5/27/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

typealias Bills = [Bill]

struct Wad: Money
{
//    var bills = Bills()
//    
//    var billCount: Int {
//        
//        get {
//            return bills.count
//        }
//    }
    
    init(amount: Int, currency: Currency)
    {
//        bills.append(Bill(amount: amount, currency: currency))
    }
    
    init () {
        
    }
    
    func times(_ multiplier: Int) -> Wad
    {
        return self
    }
    
    func plus(_ add: Wad) -> Wad
    {
        return self
    }
    
    func reduced(to: Currency, broker: Broker) throws -> Wad
    {
        return self
    }
}

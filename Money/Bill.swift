//
//  Bill.swift
//  Bill
//
//  Created by JJLZ on 5/24/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

typealias Currency = String

struct Bill: Money
{
    var amount: Int
    var currency: Currency
    
    init(amount: Int, currency: Currency = "EUR")
    {
        self.amount = amount
        self.currency = currency
    }
        
    func times(_ multiplier: Int) -> Bill
    {
        let result = self.amount * multiplier;
        
        return Bill(amount: result, currency: self.currency)
    }
    
    func plus(_ add: Bill) -> Bill
    {
        let total = self.amount + add.amount
        
        return Bill(amount: total, currency: self.currency)
    }
    
    func reduced(to: Currency, broker: Rater) throws -> Bill
    {
        let tamount = try self.amount * broker.rate(from: self.currency, to: to)
        
        return Bill(amount: tamount, currency: to)
    }
    
    // MARK: - Proxies
    
    func proxyForEquality() -> String {
        
        return "\(amount.hashValue)"
    }
}

extension Bill: Equatable
{
    public static func ==(lhs: Bill, rhs: Bill) -> Bool
    {
        return (lhs.proxyForEquality() == rhs.proxyForEquality())
    }
    
}

extension Bill: Hashable
{
    public var hashValue: Int {
 
        return self.amount.hashValue
    }
}

extension Bill: CustomStringConvertible
{
    public var description: String {
        
        get {
            return "<\(type(of:self)): \(currency)\(amount)>"
        }
    }
}



























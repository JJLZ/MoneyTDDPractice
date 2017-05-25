//
//  Euro.swift
//  Money
//
//  Created by JJLZ on 5/24/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

typealias Currency = String

class Money
{
    var amount: Int
    var currency: Currency
    
    init(amount: Int, currency: Currency)
    {
        self.amount = amount
        self.currency = currency
    }
    
    func times(_ multiplier: Int) -> Money
    {
        let result = self.amount * multiplier;
        
        return (Money(amount: result, currency: self.currency))
    }
    
    func plus(_ add: Money) -> Money
    {
        let total = self.amount + add.amount
        
        return (Money(amount: total, currency: self.currency))
    }
    
    // MARK: - Proxies
    
    func proxyForEquality() -> String {
        
        return "\(amount.hashValue)"
    }
}


extension Money: Equatable
{
    public static func ==(lhs: Money, rhs: Money) -> Bool
    {
        return (lhs.proxyForEquality() == rhs.proxyForEquality())
    }
    
}

extension Money: Hashable
{
    public var hashValue: Int {
 
        return self.amount.hashValue
    }
}

extension Money: CustomStringConvertible
{
    public var description: String {
        
        get {
            return "<\(type(of:self)): \(currency)\(amount)>"
        }
    }
}



























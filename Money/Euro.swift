//
//  Euro.swift
//  Money
//
//  Created by JJLZ on 5/24/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

class Euro
{
    var amount: Int
    
    init(amount: Int)
    {
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Euro
    {
        let result = self.amount * multiplier;
        
        return (Euro(amount: result))
    }
    
    // MARK: - Proxies
    
    func proxyForEquality() -> String {
        
        return "\(amount.hashValue)"
    }
}


extension Euro: Equatable
{
    public static func ==(lhs: Euro, rhs: Euro) -> Bool
    {
        return (lhs.proxyForEquality() == rhs.proxyForEquality())
    }
    
}

extension Euro: Hashable
{
    public var hashValue: Int {
 
        return self.amount.hashValue
    }
}

extension Euro: CustomStringConvertible
{
    public var description: String {
        
        get {
            return "<\(type(of:self)): €\(amount)>"
        }
    }
}



























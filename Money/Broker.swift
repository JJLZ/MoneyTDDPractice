//
//  Broker.swift
//  Money
//
//  Created by JJLZ on 5/25/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

enum BrokerErrors: Error
{
    case unknownRate
}

typealias Rate = Int
typealias RatesDictionary = [String: Rate]

struct Broker
{
    var _rates = RatesDictionary()
    
    private func _makeKeyForRate(from: Currency, to: Currency) -> String
    {
        return "\(from)->\(to)"
    }
    
    mutating func addRate(from: Currency, to: Currency, rate: Rate)
    {
        _rates[_makeKeyForRate(from: from, to: to)] = rate  // directo
        _rates[_makeKeyForRate(from: to, to: from)] = rate  // inverso
        _rates[_makeKeyForRate(from: from, to: from)] = 1   // trivial
        _rates[_makeKeyForRate(from: to, to: to)] = 1   // trivial
    }
    
    func rate(from: Currency, to: Currency) throws -> Rate
    {
        if from == to
        {
            return 1
        }
        
        guard let rate = _rates[_makeKeyForRate(from: from, to: to)] else
        {
            throw BrokerErrors.unknownRate
        }
        
        return rate
    }
}


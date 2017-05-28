//
//  Wad.swift
//  Money
//
//  Created by JJLZ on 5/27/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

typealias Bills = [Bill]

struct Wad
{
    var bills = Bills()
    
    var billCount: Int {
        
        get {
            return bills.count
        }
    }
}

extension Wad: Money
{
    init(amount: Int, currency: Currency)
    {
        bills.append(Bill(amount: amount, currency: currency))
    }
    
    func times(_ multiplier: Int) -> Wad
    {
        return self
    }
    
    func plus(_ add: Wad) -> Wad
    {
        let complete: Bills = self.bills + add.bills
        
        return Wad(bills: complete)
    }
    
    func plus(_ add: Bill) -> Wad
    {
        var complete = self.bills
        complete.append(add)
        
        return Wad(bills: complete)
    }
    
    func reduced(to: Currency, broker: Rater) throws -> Bill
    {
        var totalBill = Bill(amount: 0, currency: to)
        
        totalBill = self.bills.reduce(self.bills[0], {totalBill, bill in
            
            try! totalBill.reduced(to: to, broker: broker).plus(bill.reduced(to: to, broker: broker))
        })
        
        return totalBill
        
        
//        var totalBill = Bill(amount: 0, currency: to)
//        
//        for bill in self.bills
//        {
//            totalBill = try totalBill.reduced(to: to, broker: broker).plus(bill.reduced(to: to, broker: broker))
//        }
//        
//        return totalBill
    }
    
    // MARK: - Proxies
    
    func proxyForEquality() -> String {
        
        return "\(self.description.hashValue)"
    }
}

extension Wad: Equatable
{
    public static func ==(lhs: Wad, rhs: Wad) -> Bool
    {
        return (lhs.proxyForEquality() == rhs.proxyForEquality())
    }
}

extension Wad: CustomStringConvertible
{
    public var description: String {
        
        get {
            
            if billCount == 0
            {
                return "<\(type(of:self)): empty>"
            }
            else if billCount == 1
            {
                return "<\(type(of:self)): \(self.bills[0].currency)\(self.bills[0].amount)>"
            }
            else
            {
                var totalBill: Bill = Bill(amount: 0, currency: "USD")
                let broker: Rater = UnityBroker()
                
                for bill in bills
                {
                    do {
                        totalBill = try bill.reduced(to: "USD", broker: broker).plus(totalBill)
                    } catch {
                        print("Error reducing or adding Bill")
                    }
                }
                
                return "<\(type(of:self)): \(totalBill.currency)\(totalBill.amount)>"
            }
        }
    }
}






























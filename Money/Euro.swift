//
//  Euro.swift
//  Money
//
//  Created by JJLZ on 5/24/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

class Euro: NSObject
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
}

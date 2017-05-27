//
//  Money.swift
//  Money
//
//  Created by JJLZ on 5/27/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

protocol Money
{
    init(amount: Int, currency: Currency)
    func times(_ multiplier: Int) -> Self
    func plus(_ add: Self) -> Self
    func reduced(to: Currency, broker: Broker) throws -> Self
}

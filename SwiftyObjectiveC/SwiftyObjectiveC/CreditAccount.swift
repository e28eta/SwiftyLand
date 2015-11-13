//
//  CreditAccount.swift
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/13/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

import Foundation



class CreditAccount {
    
    var limit: Double
    var balance: Double
    var accountLocked: Bool = false
    var ID: Int
    
    init(id: Int, limit: Double = 3000.0, balance: Double = 0) {
        self.limit = limit
        self.balance = balance
        self.ID = id
    }
}

extension CreditAccount: AccountType {
    func deposit(amount: Double) throws {
        let pendingAmount = balance - amount

        guard pendingAmount > 0 else {
            throw DepositError.GreaterThanBalance
        }
        
        balance -= amount
    }
    
    func charge(amount: Double) throws {
        let pendingAmount = balance + amount
        
        guard !accountLocked else {
            throw ChargeError.AccountLocked(reason: "Foo")
        }
        
        guard pendingAmount < limit else {
            throw ChargeError.InsufficientBalance
        }
        
        balance -= amount
    }
}
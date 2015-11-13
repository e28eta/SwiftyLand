//
//  AccountType.swift
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/12/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

import Foundation

protocol AccountType {
    var ID: Int { get }
    func deposit(amount: Double) throws
    func charge(amount: Double) throws
}

enum ChargeError: ErrorType {
    case InsufficientBalance
    case AccountLocked(reason: String)
}

enum DepositError: ErrorType {
    case GreaterThanBalance
}
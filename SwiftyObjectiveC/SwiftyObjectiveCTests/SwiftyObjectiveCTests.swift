//
//  SwiftyObjectiveCTests.swift
//  SwiftyObjectiveCTests
//
//  Created by Erik Kerber on 11/1/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

import XCTest
import Quick
import Nimble


@testable import SwiftyObjectiveC

class SwiftyObjectiveCTests: QuickSpec {
    

    override func spec() {
        describe("Charging Account") {
            
            var account = CreditAccount(id: 3, limit: 301.00, balance: 0.00)
            account.foo
            beforeEach {
                account = CreditAccount(id: 3, limit: 301.00, balance: 0.00)
            }
            
            it("should") {
                expect{ try account.charge(304.00) }.to(throwError(ChargeError.InsufficientBalance))
            }
            
        }
    }
}

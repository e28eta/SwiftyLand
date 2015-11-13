//: [Previous](@previous)
//: # Switch and Pattern Matching

import Foundation
import UIKit


var a = ("🍕", 4, ["foo"])
switch a {
case ("🐶", 5, _):
    print("Dog")
case ("🍕", 5, _):
    print("Pizza!")
case ("🍕", _, let array) where array.count == 1:
    print("Really pizza")
case ("🍕", _, _):
    print("Really pizza")
default:
    print("shrug")
}

let indexPath = NSIndexPath(forItem: 3, inSection: 0)

let stateVariable: String? = nil

switch (indexPath.section, indexPath.item) {
case (0, 0):
    print("Special Case Header")
case (0, _) where stateVariable != nil:
    print("N rows")
case (0, _):
    print("N rows")
case (0, 0):
    print("Here")
default:
    print("")
}

switch (indexPath.section, 0..<3) {
case (0, let range) where range.count > 2: break
    
default:
    break
}


struct Person {
    var firstName: String
    var lastName: String
    var gender: Gender
}

enum Gender {
    case Male
    case Female
}

//func ~=(pattern: Gender, value: Person) -> Bool {
//    return pattern == value.gender
//}
//
func ~=(pattern: String, value: Person) -> Bool {
    return pattern == value.firstName
}

func ~=(pattern: Person, value: Person) -> Bool {
    return pattern.gender == value.gender
}

let suzy = Person(firstName: "Suzy", lastName: "Swift", gender: .Female)

switch suzy {
case Person(firstName: "Jill", lastName: "Swift", gender: .Female) where true:
    print("Suzy")
case "Suzy":
    print("Suzy Again")
//case Gender.Female:
//    print("More Suzy")
default:
    print("Not Suzy")
}


struct Account {
    var accountType: String
    var accountId: Int
}

func ~=(pattern: String, value: Account) -> Bool {
    return value.accountType == pattern
}

func ~=(pattern: Int, value: Account) -> Bool {
    return value.accountId == pattern
}

let account = Account(accountType: "Checking", accountId: 3)



switch account {
case 3:
    print("checking")
default:
    print("none")
}


//: [Next](@next)

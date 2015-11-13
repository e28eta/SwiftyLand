//: [Previous](@previous)
//: # Collections

import Foundation

var array: [String] = ["foo"]
var dictionary: [String: Int] = ["Bar": 4]
var set: Set<String> = ["3", "5"]

struct MyFoo: Hashable {
    var hashValue: Int {
        return 2
    }
}

func ==(lhs: MyFoo, rhs: MyFoo) -> Bool {
    return true
}

Set<MyFoo>()

for i in array {
    print(i)
}

for (key, value) in dictionary {
    print("\(key) \(value)")
}

for k in set {
    print(k)
}

set.insert("fizz")
set.first

//: Mutability

let constArray = [3, 5]
//constArray.append(4)

var varArray = [3, 5]
varArray.append(3)

//: [Next](@next)

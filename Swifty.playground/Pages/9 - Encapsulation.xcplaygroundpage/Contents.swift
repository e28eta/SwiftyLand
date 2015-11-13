//: [Previous](@previous)
//: # Encapsulation

import Foundation

var a = MyClass()
print(a)

enum Foo{
    case Bar
    case Fizz
}

struct Fizz: CustomDebugStringConvertible {
    var a = 2
    var b = "Hello"
    
    var debugDescription: String {
        return "\(a)!!!!\(b)"
    }
}
print(Foo.Bar)
print(Fizz())
//: [Next](@next)

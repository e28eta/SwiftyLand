//: [Previous](@previous)
//: # Operators
import Darwin

let something: AnyObject?


infix operator ≶≭≮ {
    associativity left
    precedence 149
}

/// Hello there
public func ≶≭≮(lhs: Int, rhs: Int) -> Int {
    return Int(pow(Double(lhs), Double(rhs)))
}

5 ≶≭≮ 3

//: PEMDAS

4 + 3 * 3 ≶≭≮ 4

//: [Next](@next)

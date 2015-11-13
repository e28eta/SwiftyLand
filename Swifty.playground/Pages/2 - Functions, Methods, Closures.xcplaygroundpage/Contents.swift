//: [Previous](@previous)
//:
//: # Functions, Methods, Closures

import Darwin

func pizza() {
    print("I love 🍕")
}

pizza()

struct Foo {
    func callPizza() {
        pizza()
    }
}

let food = "🍕"
let pizzaClosure: () -> Void = {
    print("I love \(food)")
}

func multiply(number: Int, value: Int) -> Int {
    return number * value
}

multiply(3, value: 5)

func multiply2(num number: Int, val value: Int) -> Int {
    return number * value
}

multiply2(num: 3, val: 5)

func multiply3(num: Int, _ value: Int) -> Int {
    return num * value
}

multiply3(3, 5)

func ipow(number: Int, power: Int = 2) -> Double {
    return pow(Double(number), Double(power))
}

ipow(3)
ipow(3, power: 4)


//: Closure

let multiplyClosure: (Int, Int) -> Int = {
    number, value in

    return number * value
}

multiplyClosure(3, 5)

let multiplyClosure2: (number: Int, _: Int) -> Int = {
    number, value in
    
    return number * value
}

var value: Int = 5
func add(number: Int) -> Int {
    value += number
    return value
}

func subtract(number: Int) -> Int {
    value -= number
    return value
}

var myAdd = add
myAdd(3)

myAdd = subtract
myAdd(5)

myAdd = {
    number in
    
    return number + number
}

func outerFunc() {
    
    func operate(number: Int) {
        print(number)
    }
    
    operate(5)
}

outerFunc()


let myTuple: (Int, String, Bool) = (3, "Swift", true)
myTuple.0.value
myTuple.1.characters.count

let myTuple2: (x: Int, name: String, Bool) = (x: 3, name: "Swift", true)

myTuple2.name
myTuple2.x

let myTuple3: ((Int, Bool), String) = ((3, true), "asf")
myTuple3.0.0

func getOrder() -> (String, String) {
    return ("foo", "asdf")
}


getOrder().0


typealias Coordinate = (String, String)

func getCoordinate() -> Coordinate {
    return ("Foo", "bar")
}

//let coordinates: (Int, Int) = (2, 3)
//
//let coordinates2: (lat: Int, lon: Int) = (lat: 2, lon: 3)
//
//typealias Coordinate = (x: Int, y: Int)
//
//func findTreasure() -> Coordinate {
//    return (x: 2, y: 3)
//}
//
//findTreasure().x
//: [Next](@next)

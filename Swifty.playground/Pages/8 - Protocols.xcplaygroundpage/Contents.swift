//: [Previous](@previous)
//: # Protocols

import Foundation

protocol Pet {
    typealias FoodType
    func feed(food: FoodType)
    var fed: Bool { get }
    var name: String { get set }
}

struct DogFood { var weight: Double }

class Dog: Pet {
    typealias FoodType = DogFood
    func feed(food: DogFood) { fed = true }
    var fed: Bool = false // Only needs readonly, still valid!
    var name: String = ""
}

protocol Bird/*: class*/ {
    var name: String { get set }
    var canFly: Bool { get }
}

struct StructyBird: Bird {
    var name: String
    let canFly = true
}

class ClassyBird: Bird {
    var name: String
    let canFly = true
    
    init(name: String) {
        self.name = name
    }
}

var structyInference = StructyBird(name: "Struct")
var structy: Bird = StructyBird(name: "Struct")
var classy = ClassyBird(name: "Class")

//structy = classy

var ss = structy
ss.name = "Foo"

print(ss.name)
print(structy.name)


//: [Next](@next)

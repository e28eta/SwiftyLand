//: [Previous](@previous)
//: # Extensions

import Foundation

struct DogFood { var weight: Double }


protocol Pet {
    typealias FoodType
    func feed(food: FoodType)
    var fed: Bool { get }
    var name: String { get set }
}


class Dog {
    var name: String = ""
    var wasFed: Bool = false
}

extension Dog: Pet {
    typealias FoodType = DogFood
    var fed: Bool {
        return wasFed
    }
    
    func feed(food: DogFood) {
        wasFed = true
    }
}

extension String {
    var banana : String {
        let shortName = String(characters.dropFirst(1))
        return "\(self) \(self) Bo B\(shortName) Banana Fana Fo F\(shortName)"
    }
}

extension Dog {
    //var foo: String = "asf"
    var bar: String {
        return "asdf"
    }
}

print("Bob".banana)

//: [Next](@next)

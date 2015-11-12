//: [Previous](@previous)

import Foundation

extension NSUserDefaults {
    
    func valueFromDefaults<T>(key: String, defaultValue: T) -> T {
        return valueForKey(key, T.self) ?? defaultValue
    }
    
    func valueForKey<T>(key: String, _: T.Type) -> T? {
        return self.objectForKey(key) as? T
    }
}

NSUserDefaults.standardUserDefaults().setValue("hello", forKey: "foo")
NSUserDefaults.standardUserDefaults().synchronize()
NSUserDefaults.standardUserDefaults().valueForKey("foo")

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

//: [Next](@next)

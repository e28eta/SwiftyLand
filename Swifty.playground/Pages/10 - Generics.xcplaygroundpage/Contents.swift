//: [Previous](@previous)
//: # Generics


import Foundation

protocol Animal {
    func feed()
}

struct Keeper<T: Animal> {
    var animal: T
    
    init(animal: T) {
        self.animal = animal
    }
    
    func feed() {
        animal.feed()
    }
}

struct Dog: Animal {
    func feed() {
        print("Yum")
    }
}

//let keeper = Keeper<String>(animal: "asdf")

var a: Any = Keeper<Dog>(animal: Dog())


//: [Next](@next)

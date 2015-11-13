//: [Previous](@previous)
//: # Classes

import Foundation

class A {
    var a: String
    
    init(a: String) {
        print("A")
        self.a = a
    }
    
    func foo() {
        print(a)
    }
}

class B: A {
    let b: String
    
    required init(b: String) {
        self.b = "foo"
                print("B")
        super.init(a: b)
                print("B")
    }
}

class C: B {
    
    static var staticString = "Foo"

    class var calcString: String {
        return "Bar"
    }
    
    var c: String
    
    required init(b: String) {
        self.c = "C"
                print("C")
        super.init(b: b)
                print("C")
    }
    
    convenience init() {

        self.init(b: "Foo")
        self.c = "asdf"
    }
    
    final override func foo() {
        print(a)
    }
}
C.staticString = "ZZZ"

//class D: C {
//    override func foo() {
//        
//    }
//}

let c = C(b: "Hello")

c.c

//: [Next](@next)

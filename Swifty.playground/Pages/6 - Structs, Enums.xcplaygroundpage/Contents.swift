//: [Previous](@previous)
//: # Structs, Enums

protocol Wingspannable {
    var wingSpan: Int { get }
}

struct SwiftyBird: Wingspannable {
    var name: String
    let wingSpan: Int = 4
    
    init(aName: String) {
        self.name = aName
    }
}

SwiftyBird(aName: "Swift")


class ClassyBird {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printSelf() {
        print(name)
    }
    
    func doSync() {
        let block: (Int) -> Void = {
            [unowned self] number in
            self.printSelf()
        }
        
        let block2: (Int) -> Void = {
            [weak self] number in
            
            guard let strongSelf = self else {
                // special case
                return
            }
            
            if (false ) {
                // special case
            }
            
            // Happy path
            strongSelf.printSelf()
        }
        
        block(3)
        block2(3)
    }
    
    var optionalString: String? = "Hello"
    func optionalUnwrap() {
        
        guard let unwrappedString = optionalString else {
            return
        }
        
        print(unwrappedString)
    }
    
//    private var myRealProperty: Int = 0
    var myProperty: Int = 2 {
        willSet {
            print(newValue)
        }
        didSet {
            print(myProperty)
        }
    }
}

ClassyBird(name: "ClassyBird")


enum EnummyBird {
    case Swift
    case UnladenSwallow
    case Unknown
}

let bird: EnummyBird = .Swift
let otherBird = EnummyBird.UnladenSwallow

print(bird)

enum IntyEnummyBird: Int {
    case Swift = 0
    case UnladenSwallow
    case Unknown = 22
    
    init(string: String) {
        switch string {
        case "Swift":
            self = .Swift
        default:
            self = .Unknown
        }
    }
    
    func myMethod() {
        
    }
    
    var foo: String {
        return "Foo"
    }
}

print(IntyEnummyBird.UnladenSwallow.rawValue)

IntyEnummyBird(rawValue: 1)

IntyEnummyBird(string: "Swift")

IntyEnummyBird.UnladenSwallow.foo

struct A {
    var number: Int
}

class B {
    var number = 2
}

enum C {
    case One
    case Two
}

var a = A(number: 2)
var b = B()
var c = C.Two

var aa = a
var bb = b
var cc = c

print(a.number)
print(b.number)
print(c)

aa.number = 1
bb.number = 1
cc = .One

print(a.number)
print(b.number)
print(c)


//: Struct immutability

struct Cat {
    var wasFed = false
    
    mutating func feed() {
        /* 

        Tons of code


        More tons of code


        Make network call {
            self.wasFed = true
        }
        
        */
    }
    
    mutating func newCat() {
        self = Cat()
    }
}

var cat = Cat()
cat.wasFed = true
print(cat)


var array = [2, 4, 5]
array.append(4)

let constArray = [2, 5, 6]
// constArray.append(7)

enum AssociatedFoo {
    case Foo(value: Cat)
    case Bar
}

var assocFoo: AssociatedFoo = .Bar
assocFoo = .Foo(value: Cat())

switch assocFoo {
case .Foo(let cat) where cat.wasFed:
    print(cat)
    fallthrough
//case cat:
//    print("Cat")
case .Bar:
    print("Bar")
default:
    break
}

enum Fallthrough {
    case FF
    case EE
}

switch Fallthrough.FF {
case .FF,  .EE:
    print("Hi")
}

let optionalString: String? = nil
switch optionalString {
case .None:
    print("none")
    break
    
case .Some(let value):
    print(value)
}

//switch Fallthrough.FF {
//case .FF: fallthrough
//case .EE: fallthrough
//    print("Hi")
//}



//: [Next](@next)

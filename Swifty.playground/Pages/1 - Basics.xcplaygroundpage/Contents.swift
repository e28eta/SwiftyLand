//: # Strings

import UIKit

let swift = "I love Swift!"
swift.characters.count

let frogDog = "🐸🐶"
frogDog.characters.count
frogDog.unicodeScalars.count

let family = "👨‍👨‍👧‍👦"
family.characters.count

family.characters.forEach { char in
    print(char)
}

var anotherFamily = ""
anotherFamily.append(Character("👨‍"))
anotherFamily.append(Character("👨‍"))
anotherFamily.append(Character("👧‍"))
anotherFamily.append(Character("👦"))
anotherFamily.unicodeScalars.count



//: [Next](@next)



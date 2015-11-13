import Foundation

public class MyClass {
    public var name: String = "Name"
    private var myInternalName: String = "Can't See me"
    
    public init() {
        
    }
}

public class MyOtherClass {
    
    var myClass: String = MyClass().myInternalName
    
    var myInternalName: String = "Can't See me"
    
    public init() {
        ++self
    }
}

private prefix func ++(cc: MyOtherClass) {
    print("Hi")
}
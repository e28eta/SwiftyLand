//: [Previous](@previous)

import Foundation

//: Because any object in Objective-C can attempted to be accessed via KVC, everything can be assumed a dictionary
//:
//: ```
//: json[@"foo"][@"bar"][0][@"fizz"]
//: ```
let stringData = "[{\"person\": {\"name\":\"Dani\",\"age\":\"24\"}},{\"person\": {\"name\":\"ray\",\"age\":\"70\"}}]".dataUsingEncoding(NSUTF8StringEncoding)!

var parseError: NSError?
let parsedObject: AnyObject? = try! NSJSONSerialization.JSONObjectWithData(stringData,
    options: NSJSONReadingOptions.AllowFragments)


parsedObject

//: [Next](@next)



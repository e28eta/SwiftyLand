//
//  SwiftyAccountService.swift
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/13/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

import Foundation

func getData(completion: () -> Void) {
    let stringData = "[{\"person\": {\"name\":\"Dani\",\"age\":\"24\"}},{\"person\": {\"name\":\"ray\",\"age\":\"70\"}}]".dataUsingEncoding(NSUTF8StringEncoding)!
    
    let _: AnyObject? = try! NSJSONSerialization.JSONObjectWithData(stringData,
        options: NSJSONReadingOptions.AllowFragments)
    
    
    completion()
    
    
}
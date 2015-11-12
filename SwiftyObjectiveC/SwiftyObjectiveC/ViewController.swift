//
//  ViewController.swift
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/1/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    
        DBTwitterService.sharedClient().getTweets ( { (products, error) -> Void in
            
        })
        
//        DBTwitterService.sharedClient().getAppleProducts { error in
//            
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


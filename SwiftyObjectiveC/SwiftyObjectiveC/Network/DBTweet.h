//
//  DBTweet.h
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/11/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBTweet : NSObject

@property (copy, nonatomic) NSString *tweet;
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSDate *timeStamp;

@end

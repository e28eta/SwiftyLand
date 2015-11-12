//
//  DBTwitterService.h
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/2/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTweet.h"

typedef NS_ENUM(NSInteger, DBTwitterUserType) {
    DBTwitterUserTypeRegular,
    DBTwitterUserTypeVerified,
};


@interface DBTwitterService : NSObject

+ (instancetype)sharedClient;

- (void)getTweets:(void (^)(NSArray *tweets, NSError *error))completion;

- (void)betterGetTweets:(void (^)(NSArray <DBTweet *> *tweets, NSError *error))completion;


@end

//
//  DBTwitterService.m
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/2/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

#import "DBTwitterService.h"

@implementation DBTwitterService

+ (instancetype)sharedClient {
    static DBTwitterService *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[DBTwitterService alloc] init];
    });
    
    return _sharedClient;
}

- (void)getTweets:(void (^)(NSArray *products, NSError *error))completion
{
    completion(@[@"Hello"], nil);
}

- (void)betterGetTweets:(void (^)(NSArray <DBTweet *> *tweets, NSError *error))completion
{
    completion(@[[[DBTweet alloc] init]], nil);
}

@end

//
//  DBTwitterService.m
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/2/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

#import "DBAccountService.h"

@implementation DBAccountService

+ (instancetype)sharedClient {
    static DBAccountService *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[DBAccountService alloc] init];
    });
    
    return _sharedClient;
}

- (void)getAccounts:(void (^)(NSArray *products, NSError *error))completion
{
    completion(@[@"Hello"], nil);
}

//- (void)betterGetAccounts:(void (^)(NSArray <DBAccount *> *tweets, NSError *error))completion
//{
//    completion(@[[[DBTweet alloc] init]], nil);
//}

@end

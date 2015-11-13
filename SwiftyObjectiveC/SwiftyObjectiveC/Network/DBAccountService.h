//
//  DBTwitterService.h
//  SwiftyObjectiveC
//
//  Created by Erik Kerber on 11/2/15.
//  Copyright © 2015 Erik Kerber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBAccount.h"

typedef NS_ENUM(NSInteger, DBAccountUserType) {
    DBAccountUserTypeRegular,
    DBAccountUserTypeVerified,
};


@interface DBAccountService : NSObject

+ (instancetype)sharedClient;

- (void)getAccounts:(void (^)(NSArray *tweets, NSError *error))completion;

// - (void)betterGetAccounts:(void (^)(NSArray <DBTweet *> *tweets, NSError *error))completion;


@end

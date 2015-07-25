//
//  ConstantsSocialNetworkLibrary.h
//  UniversalSharing
//
//  Created by Roman on 7/21/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstantsSocialNetworkLibrary : NSObject
typedef void (^Complition)(id result, NSError *error);

typedef NS_ENUM (NSInteger, NetworkType) {
    Facebook,
    VKontakt,
    Twitter
};

FOUNDATION_EXPORT NSString *const ALL_USER_FIELDS;
FOUNDATION_EXPORT NSString *const kVkAppID;
FOUNDATION_EXPORT NSString *const kRequestParametrsFacebook;
FOUNDATION_EXPORT NSString *const kTwitterUserName;
FOUNDATION_EXPORT NSString *const kTwitterUserCount;
FOUNDATION_EXPORT NSString *const kRequestUrlTwitter;

@end

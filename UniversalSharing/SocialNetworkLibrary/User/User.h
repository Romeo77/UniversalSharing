//
//  User.h
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConstantsSocialNetworkLibrary.h"

@interface User : NSObject
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *dateOfBirth;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *clientId;
@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSString *friends;
@property (strong, nonatomic) NSString *networkType;

+ (User*) createFromDictionary:(NSDictionary*) dict andNetworkType :(NetworkType) networkType;

@end

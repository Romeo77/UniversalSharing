//
//  User.m
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "User.h"

@implementation User

+ (User*) createFromDictionary:(NSDictionary*) dict andNetworkType :(NetworkType) networkType
{
    User *user = [User new];
    switch (networkType) {
            
        case Facebook:
            
            user.userName = [dict objectForKey:@"username"];
            user.firstName = [dict objectForKey:@"first_name"];
            user.lastName = [dict objectForKey:@"last_name"];
            user.dateOfBirth = [dict objectForKey:@"birthday"];
            user.city = [dict objectForKey:@"location"];
            user.clientId = [dict objectForKey:@"id"];
            user.photoURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", user.clientId];
            user.friends = [dict objectForKey:@"friends"];
            user.networkType = [dict objectForKey:@"email"];
            break;
            
        case VKontakt:
            
            user.firstName = [dict objectForKey:@"first_name"];
            user.lastName = [dict objectForKey:@"last_name"];
            //user.dateOfBirth = [dict objectForKey:@"birthday"];
            //user.city = [dict objectForKey:@"location"];
            user.clientId = [[dict objectForKey:@"id"] stringValue];
            user.photoURL = [dict objectForKey:@"photo_200_orig"];
            break;
            
        case Twitter:
            
            user.firstName = [dict objectForKey:@"name"];
            user.lastName = [dict objectForKey:@"screen_name"];
            //user.dateOfBirth = [dict objectForKey:@"birthday"];
            //user.city = [dict objectForKey:@"location"];
            user.clientId = [[dict objectForKey:@"id"]stringValue];
            user.photoURL = [dict objectForKey:@"profile_image_url_https"];
            break;
            
        default:
            break;
    }
    
    return user;
    
}

@end

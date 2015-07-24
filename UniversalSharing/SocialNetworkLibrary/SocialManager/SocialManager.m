//
//  LoginManager.m
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "SocialManager.h"
@interface SocialNetwork()

@end
static SocialManager *model = nil;

@implementation SocialManager
+ (SocialManager*) sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[SocialManager alloc] init];
    });
    return  model;
}

- (NSArray*) networks {
    FacebookNetwork *facebookNetwork = [FacebookNetwork sharedManager];//[[FacebookNetwork alloc]init] is THE fucking mistake!!!
    VKNetwork *vkNetwork = [VKNetwork sharedManager];
    TwitterNetwork *twitterNetwork = [TwitterNetwork sharedManager];
    self.arrayWithNetworks = [[NSArray alloc ]initWithObjects:facebookNetwork, vkNetwork, twitterNetwork, nil];
    return self.arrayWithNetworks;
}

- (void) loginInNetwork:(NSInteger)networkIdentifier :(Complition) block{
    
    SocialNetwork *socialNetwork = [SocialNetwork new];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"networkType == %d", networkIdentifier];//&& isLogin == 0
    NSArray *arrayPredicate = [self.arrayWithNetworks filteredArrayUsingPredicate:predicate];
    
    if (arrayPredicate.count > 0) {
        socialNetwork = [arrayPredicate firstObject];
    }
    if (socialNetwork.isLogin) {//it does not need))
        block(socialNetwork,nil);
    }else{
        [socialNetwork loginWithComplition:^(id result, NSError *error) {
            block(result,error);
        }];
    }
}
@end

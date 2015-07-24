//
//  CacheImage.h
//  UniversalSharing
//
//  Created by Roman on 7/23/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheImage : NSObject
+ (CacheImage*) sharedManager;
- (void)cacheImage:(UIImage*)image forKey:(NSString*)key;
- (UIImage*)obtainCachedImageForKey:(NSString*)key;
@end

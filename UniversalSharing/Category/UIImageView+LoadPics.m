//
//  UIImageView+LoadPics.m
//  UniversalSharing
//
//  Created by Roman on 7/23/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "UIImageView+LoadPics.h"
#import "CacheImage.h"
#import "LoginTableViewCell.h"

@implementation UIImageView (LoadPics)

- (void)obtainImageByUrl :(NSString*)stringUrl {
    UIImage *image = [[ CacheImage sharedManager] obtainCachedImageForKey:stringUrl];
    if(image){
       self.image = image;
       return;
    }
    
    __weak UIImageView *weakSelf = self;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:stringUrl]];
    NSOperationQueue *queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.image = [UIImage imageWithData:data];
            [[CacheImage sharedManager] cacheImage:weakSelf.image forKey:stringUrl];
        });
    }];
}

@end

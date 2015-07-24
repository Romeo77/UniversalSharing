//
//  UIImageView+ImageView.m
//  UniversalSharing
//
//  Created by Roman on 7/22/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "UIImageView+ImageViewCategory.h"

@implementation UIImageView (ImageViewCategory)
- (void) roundImageView {
    self.layer.cornerRadius = 25;
    self.layer.masksToBounds = YES;    
}
@end

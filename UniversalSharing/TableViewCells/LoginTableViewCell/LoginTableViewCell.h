//
//  LoginTableViewCell.h
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginTableViewCell : UITableViewCell


+ (NSString*) cellId;
+ (LoginTableViewCell*) LoginTableViewCell;
- (void) configurationLoginTableViewCell :(id) socialNetwork;
@end

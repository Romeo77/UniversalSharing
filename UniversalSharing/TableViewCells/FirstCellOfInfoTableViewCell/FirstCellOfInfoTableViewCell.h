//
//  FirstCellOfInfoTableViewCell.h
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstCellOfInfoTableViewCell : UITableViewCell

+ (NSString*) cellId;
+ (FirstCellOfInfoTableViewCell*) FirstCellOfInfoTableViewCell;
- (void) configurationLoginTableViewCell :(id) socialNetwork;

@end

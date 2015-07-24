//
//  OtherCellOfInfoTableViewCell.h
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherCellOfInfoTableViewCell : UITableViewCell

+ (NSString*) cellId;
+ (OtherCellOfInfoTableViewCell*) OtherCellOfInfoTableViewCell;
- (void) configurationLoginTableViewCell :(SocialNetwork*)socialNetwork :(NSIndexPath *)indexPath;
@end

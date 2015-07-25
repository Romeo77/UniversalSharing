//
//  FirstCellOfInfoTableViewCell.m
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "FirstCellOfInfoTableViewCell.h"
@interface FirstCellOfInfoTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *firstNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLbl;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@end
@implementation FirstCellOfInfoTableViewCell

+ (NSString*) cellId {
    
    return NSStringFromClass([FirstCellOfInfoTableViewCell class]);
}

- (void)awakeFromNib {//one time round pic
    [self.userImage roundImageView];
}

- (NSString *)reuseIdentifier// or to do in xib like OtherCellOfInfoTableViewCell////////////////////////////////
{
    return [FirstCellOfInfoTableViewCell cellId];
}

+ (FirstCellOfInfoTableViewCell*) FirstCellOfInfoTableViewCell {
    NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:[FirstCellOfInfoTableViewCell cellId] owner:nil options:nil];
    return nibArray[0];
}

- (void) configurationLoginTableViewCell :(SocialNetwork*) socialNetwork {
    [self.userImage obtainImageByUrl:socialNetwork.icon];
    self.firstNameLbl.text = socialNetwork.currentUser.firstName;
    self.lastNameLbl.text = socialNetwork.currentUser.lastName;
}


@end

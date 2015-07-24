//
//  OtherCellOfInfoTableViewCell.m
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "OtherCellOfInfoTableViewCell.h"
@interface OtherCellOfInfoTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameUserDataLbl;
@property (weak, nonatomic) IBOutlet UILabel *userDataLbl;

@end
@implementation OtherCellOfInfoTableViewCell

+ (NSString*) cellId{
    
    return NSStringFromClass([OtherCellOfInfoTableViewCell class]);
}

+ (OtherCellOfInfoTableViewCell*) OtherCellOfInfoTableViewCell{
    NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:[OtherCellOfInfoTableViewCell cellId] owner:nil options:nil];
    return nibArray[0];
}

- (void) configurationLoginTableViewCell :(SocialNetwork*) socialNetwork :(NSIndexPath *)indexPath{
    // or as variant via array!!!
    switch (indexPath.row) {
        case 1:
            self.nameUserDataLbl.text = @"Birthday :";
            self.userDataLbl.text = socialNetwork.currentUser.dateOfBirth;
            break;
        case 2:
            self.nameUserDataLbl.text = @"clientID :";
            self.userDataLbl.text = socialNetwork.currentUser.clientId;
            break;
            
        default:
            break;
    }
    
}

@end

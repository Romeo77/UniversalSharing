//
//  LoginTableViewCell.m
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "LoginTableViewCell.h"
@interface LoginTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *networkLable;
@end
@implementation LoginTableViewCell

+ (NSString*) cellId {
    
    return NSStringFromClass([LoginTableViewCell class]);
}

- (void)awakeFromNib {//one time round pic
    [self.userImage roundImageView];
}

- (NSString *)reuseIdentifier// or to do in xib like OtherCellOfInfoTableViewCell////////////////////////////////
{
    return [LoginTableViewCell cellId];
}

+ (LoginTableViewCell*) LoginTableViewCell{
    NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:[LoginTableViewCell cellId] owner:nil options:nil];
    return nibArray[0];
}

- (void) configurationLoginTableViewCell :(SocialNetwork*) socialNetwork {
    
    if ([self checkStringOnUrl:socialNetwork.icon])//check by url
        [self.userImage obtainImageByUrl:socialNetwork.icon];
    else
        self.userImage.image = [UIImage imageNamed:socialNetwork.icon];
    
    self.networkLable.text = socialNetwork.title;
}

-(BOOL) checkStringOnUrl :(NSString*) stringUrl {
    NSURL *candidateURL = [NSURL URLWithString:stringUrl];
    if (candidateURL && candidateURL.scheme && candidateURL.host)
        return YES;
    
    return NO;
}

@end

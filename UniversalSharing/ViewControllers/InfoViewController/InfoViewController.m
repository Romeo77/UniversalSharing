//
//  InfoViewController.m
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "InfoViewController.h"
#import "SocialNetwork.h"

@interface InfoViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(64,0,0,0);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        FirstCellOfInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FirstCellOfInfoTableViewCell cellId]];
        
        if(!cell){
            cell = [FirstCellOfInfoTableViewCell FirstCellOfInfoTableViewCell];
        }
        [cell configurationLoginTableViewCell:self.socialNetwork];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return  cell;
    }
    OtherCellOfInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[OtherCellOfInfoTableViewCell cellId]];
    if(!cell){
        
        cell = [OtherCellOfInfoTableViewCell OtherCellOfInfoTableViewCell];
    }
    [cell configurationLoginTableViewCell:self.socialNetwork :indexPath];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat sizeCell = 44;
    if (indexPath.row == 0) {
        sizeCell = 70;
    }
    return sizeCell;
}

- (IBAction)logoutBtnTapped:(id)sender {
    if (self.socialNetwork.networkType == Twitter && [[NSUserDefaults standardUserDefaults]integerForKey:kTwitterUserCount] > 1) {        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to logout or change account"
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:@"Change"
                                              otherButtonTitles:@"logout",nil];
        [alert show];
    }else {
        [self.socialNetwork  loginOut];
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationReloadTableView object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.socialNetwork  loginOut];
    if (!buttonIndex) {
        [self.socialNetwork loginWithComplition:^(id result, NSError *error) {
            [self.tableView reloadData];
        }];
    }
    else {
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationReloadTableView object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end

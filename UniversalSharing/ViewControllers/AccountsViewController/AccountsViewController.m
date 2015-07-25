//
//  ViewController.m
//  UniversalSharing
//
//  Created by Roman on 7/20/15.
//  Copyright (c) 2015 Roman. All rights reserved.
//

#import "AccountsViewController.h"
#import "InfoViewController.h"

@interface AccountsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *arrayWithNetworksObj;
@property (strong, nonatomic) SocialNetwork *socialNetwork;
@end

@implementation AccountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:notificationReloadTableView object:nil];
    //self.tableView.contentInset = UIEdgeInsetsMake(-70,0,0,0);
    self.arrayWithNetworksObj = [[SocialManager sharedManager] networks];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {    
    return self.arrayWithNetworksObj.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LoginTableViewCell cellId]];
    SocialNetwork *socialNetwork = self.arrayWithNetworksObj[indexPath.row];
    
    if(!cell){        
        cell = [LoginTableViewCell LoginTableViewCell];
    }
    [cell configurationLoginTableViewCell:socialNetwork];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.socialNetwork = self.arrayWithNetworksObj[indexPath.row];
    if (self.socialNetwork.currentUser) {
        [self performSegueWithIdentifier: kSegueIdentifier sender:nil];
        
    }
    else{
        __weak AccountsViewController *weakSelf = self;
        [[SocialManager sharedManager] loginInNetwork:indexPath.row :^(id result, NSError *error) {
            if (result) {
                weakSelf.socialNetwork = result;
                [weakSelf performSegueWithIdentifier: kSegueIdentifier sender:nil];
            }                    
        }];
    }
}

- (void) reloadTableView {
    [self.tableView reloadData];
}
#pragma mark prepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    InfoViewController *vc = [InfoViewController new];
    if ([[segue identifier] isEqualToString:kSegueIdentifier]) {
        vc = [segue destinationViewController];
        vc.socialNetwork = self.socialNetwork;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

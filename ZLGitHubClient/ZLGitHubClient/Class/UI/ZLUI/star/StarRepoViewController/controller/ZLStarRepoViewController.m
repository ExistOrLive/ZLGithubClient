//
//  ZLStarRepoViewController.m
//  ZLGitHubClient
//
//  Created by BeeCloud on 2019/12/9.
//  Copyright © 2019 ZM. All rights reserved.
//

#import "ZLStarRepoViewController.h"

@interface ZLStarRepoViewController ()

@end

@implementation ZLStarRepoViewController

+ (UIViewController *)getOneViewController
{
    return [ZLStarRepoViewController new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = ZLLocalizedString(@"star", "标星");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
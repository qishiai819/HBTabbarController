//
//  OneNextViewController.m
//  HBTabbarController
//
//  Created by qihb on 2017/3/3.
//  Copyright © 2017年 Qihb. All rights reserved.
//

#import "OneNextViewController.h"

@interface OneNextViewController ()

@end

@implementation OneNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNaviWithBackBtn:YES];
    self.title = @"OneNext";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

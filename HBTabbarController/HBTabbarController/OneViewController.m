//
//  OneViewController.m
//  HBTabbarController
//
//  Created by qihb on 2017/3/3.
//  Copyright © 2017年 Qihb. All rights reserved.
//

#import "OneViewController.h"
#import "OneNextViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *nextBtn = [UIButton new];
    nextBtn.frame = CGRectMake(0, 0, 80, 40);
    nextBtn.center = self.view.center;
    nextBtn.backgroundColor = [UIColor orangeColor];
    [nextBtn setTitle:@"Next" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [nextBtn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:nextBtn];
    
}

-(void)nextVC{
    [self.navigationController pushViewController:[OneNextViewController new] animated:YES];
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

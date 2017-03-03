//
//  HBBaseViewController.m
//  HBTabbarController
//
//  Created by qihb on 2017/3/3.
//  Copyright © 2017年 Qihb. All rights reserved.
//

#import "HBBaseViewController.h"
#import "SDAutoLayout.h"

#define kNaviView_Height 64
#define kNaviView_BackBtn_Width 64

@interface HBBaseViewController ()

@end

@implementation HBBaseViewController{
    UIButton *backBtn;
    UILabel *titleLabel;
}


//屏蔽设置标题的方法，防止误调用引发的tabbar问题
-(void)setTitle:(NSString *)title{
    if (self.navigationView) {
        titleLabel.text = title;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*** config ***/
    
    //把系统的naviBar隐藏掉
    self.navigationController.navigationBarHidden = YES;
    
}


- (UIView *)createNaviWithBackBtn:(BOOL)isBack{
    /*** Create ***/
    UIView *bgView = [[UIView alloc]init];
    [self.view addSubview:bgView];
    
    //是否需要返回按钮
    if (isBack) {
        backBtn = [UIButton new];
        [bgView addSubview:backBtn];
        [backBtn setImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateHighlighted];
//        backBtn.backgroundColor = [UIColor redColor];
//        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [backBtn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    
    titleLabel = [UILabel new];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = [UIColor redColor];
    [bgView addSubview:titleLabel];
    
    UILabel *line = [UILabel new];
    [bgView addSubview:line];
    
    /**** Layout ****/
    
    bgView.sd_layout
    .leftEqualToView(self.view)
    .topEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(kNaviView_Height);
    
    if (isBack) {
        backBtn.sd_layout
        .leftEqualToView(bgView)
        .topSpaceToView(bgView,20)
        .bottomEqualToView(bgView)
        .widthIs(44);
        
        backBtn.imageView.sd_layout
        .centerXEqualToView(backBtn)
        .centerYEqualToView(backBtn)
        .widthRatioToView(backBtn,0.4)
        .heightRatioToView(backBtn,0.6);
    }
    
    titleLabel.sd_layout
    .topSpaceToView(bgView,20)
    .bottomEqualToView(bgView)
    .centerXEqualToView(bgView)
    .widthRatioToView(bgView,0.5);
    
    line.sd_layout
    .leftEqualToView(bgView)
    .rightEqualToView(bgView)
    .bottomEqualToView(bgView)
    .heightIs(0.5);
    
    /*** SET ***/
    
    bgView.backgroundColor = [UIColor whiteColor];
    line.backgroundColor = [UIColor lightGrayColor];
    
    _navigationView = bgView;
    return bgView;
}

-(void)popViewController{
    [self.navigationController popViewControllerAnimated:NO];
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

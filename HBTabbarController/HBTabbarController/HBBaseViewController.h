//
//  HBBaseViewController.h
//  HBTabbarController
//
//  Created by qihb on 2017/3/3.
//  Copyright © 2017年 Qihb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBBaseViewController : UIViewController


@property (nonatomic , weak, readonly) UIView * navigationView;

/**
 *  创建导航栏（自定义）
 */
- (UIView *)createNaviWithBackBtn:(BOOL)isBack;

/**
 *  返回按钮的action 用于present模式切换的重写
 */
-(void)popViewController;

@end

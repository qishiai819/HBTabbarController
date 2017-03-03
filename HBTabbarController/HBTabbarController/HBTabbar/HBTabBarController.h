//
//  TTTabBarController.h
//  TabbarTest
//
//  Created by qihb on 2017/2/16.
//  Copyright © 2017年 Qihb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBTabBarController : UITabBarController

//单例模式，方便后期切换
+ (instancetype)shareInstance;


@end

//
//  TTTabBar.h
//  TabbarTest
//
//  Created by qihb on 2017/2/16.
//  Copyright © 2017年 Qihb. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HBTabBar;

@protocol HBTabBarDelegate <NSObject>

- (void)tabbar:(HBTabBar *)tabbar didSelectedControllerFrom:(NSInteger)fromIndex to:(NSInteger)toIndex;

@end

@interface HBTabBar : UIView

@property (nonatomic, weak) id <HBTabBarDelegate> tabbarDelegate;


- (void)addTabbarItem:(UITabBarItem *)item;

@end

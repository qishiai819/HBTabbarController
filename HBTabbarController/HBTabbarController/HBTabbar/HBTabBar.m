//
//  TTTabBar.m
//  TabbarTest
//
//  Created by qihb on 2017/2/16.
//  Copyright © 2017年 Qihb. All rights reserved.
//

#import "HBTabBar.h"
#import "HBTabBarButton.h"



@interface HBTabBar ()

@property (nonatomic, weak) HBTabBarButton * currentButton;

@property (nonatomic ,strong) NSMutableArray * itemsArr;

@end


@implementation HBTabBar{
    UILabel *line;
}


- (instancetype)init{
    if (self = [super init]) {
        line = [UILabel new];
        [self addSubview:line];
        line.backgroundColor = [UIColor lightGrayColor];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



-(NSMutableArray *)itemsArr{
    if (!_itemsArr) {
        _itemsArr = [NSMutableArray array];
    }
    return _itemsArr;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    line.frame = CGRectMake(0, 0, self.bounds.size.width, 0.5);
    
    
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width/self.itemsArr.count;
    CGFloat btnH = self.frame.size.height;
    
    for (int i = 0; i < self.itemsArr.count; i++) {
        CGFloat btnX = btnW * i;
        HBTabBarButton *tabBarBtn = self.itemsArr[i];
        tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        tabBarBtn.tag = i;
    }
}




-(void)addTabbarItem:(UITabBarItem *)item{
    
    HBTabBarButton *tabBarButton = [[HBTabBarButton alloc]init];
    tabBarButton.tabBarItem = item;
    [self addSubview:tabBarButton];
    
    tabBarButton.tag = self.itemsArr.count;//设置下标
    
    [self.itemsArr addObject:tabBarButton];//添加至数组
    //添加点击事件
    //这里使用的touchDown
    [tabBarButton addTarget:self action:@selector(selectTabBarButton:) forControlEvents:UIControlEventTouchDown];
    
    
    //设置默认选中
    if (self.itemsArr.count == 1) {
        //只会在加载第一个的时候调用一次
        [self selectTabBarButton:tabBarButton];
    }
}


-(void)selectTabBarButton:(HBTabBarButton *)selectBtn{
    if (self.tabbarDelegate && [self.tabbarDelegate respondsToSelector:@selector(tabbar:didSelectedControllerFrom:to:)]) {
        [self.tabbarDelegate tabbar:self didSelectedControllerFrom:self.currentButton.tag to:selectBtn.tag];
    }
    //改变样式
    self.currentButton.selected = NO;
    selectBtn.selected = YES;
    //更新当前选中
    self.currentButton = selectBtn;
}



@end

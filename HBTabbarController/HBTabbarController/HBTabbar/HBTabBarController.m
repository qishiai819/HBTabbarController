//
//  TTTabBarController.m
//  TabbarTest
//
//  Created by qihb on 2017/2/16.
//  Copyright © 2017年 Qihb. All rights reserved.
//

#import "HBTabBarController.h"
#import "HBTabBar.h"
#import "HBNavigationController.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"


@interface HBTabBarController ()<HBTabBarDelegate>

@property (nonatomic ,strong) HBTabBar * myTabBar;

@end

@implementation HBTabBarController{
    NSInteger oldIndex;
    NSInteger newIndex;
}

//单例模式
+ (instancetype)shareInstance{
    static HBTabBarController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HBTabBarController alloc]init];
    });
    return instance;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    oldIndex = newIndex = 0;
    
    self.myTabBar = [[HBTabBar alloc] init];
    self.myTabBar.frame = self.tabBar.bounds;
    self.myTabBar.tabbarDelegate = self;
    [self.tabBar addSubview:self.myTabBar];
    
    [self setupViewControllers];
}
//设置控制器
-(void)setupViewControllers{
    //标题
    NSArray *titles = @[@"One",@"Two",@"Three",@"Four"];
    //正常图片
    NSArray *normalImages = @[@"tabbar_about",@"tabbar_account",@"tabbar_libiary",@"tabbar_help"];
    //选中后的图片
    NSArray *selectedImages = @[@"tabbar_about_selected",@"tabbar_account_selected",@"tabbar_libiary_selected",@"tabbar_help_selected"];
    
    
    NSArray *allControllers = @[[OneViewController new],[TwoViewController new],[ThreeViewController new],[FourViewController new]];
    
    
    for (int i=0; i<allControllers.count; i++) {
        UIViewController *childVc = allControllers[i];
        [self configController:childVc title:titles[i] normalImage:normalImages[i] selectedImage:selectedImages[i]];
    }
    
}

- (void)configController:(UIViewController *)childVc title:(NSString *)title normalImage:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    HBNavigationController *nav = [[HBNavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.myTabBar addTabbarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [child removeFromSuperview];
        }
    }
}


#pragma mark ⌘▶︎ TTTabBarDelegate ◀︎⌘
-(void)tabbar:(HBTabBar *)tabbar didSelectedControllerFrom:(NSInteger)fromIndex to:(NSInteger)toIndex{
    oldIndex  = fromIndex;
    newIndex = toIndex;
    self.selectedIndex = toIndex;
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

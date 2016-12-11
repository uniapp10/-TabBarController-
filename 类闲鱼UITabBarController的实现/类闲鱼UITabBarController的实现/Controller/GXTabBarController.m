//
//  GXTabBarController.m
//  demo
//
//  Created by yangfutang on 16/5/9.
//  Copyright © 2016年 yangfutang. All rights reserved.
//

#import "GXTabBarController.h"
#import "GXHomeController.h"
#import "GXDiscoverController.h"
#import "GXPlusController.h"
#import "GXMsgController.h"
#import "GXMineController.h"
#import "GXNavigationController.h"
#import "GXCustomTabBar.h"

@interface GXTabBarController ()

@end

@implementation GXTabBarController

// 设置颜色
+ (void)initialize {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *attrubute = [NSMutableDictionary dictionary];
    attrubute[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:attrubute forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GXCustomTabBar *customTabBar = [[GXCustomTabBar alloc] initWithImageName:@"dis_liveCast" title:@"直播" tabBarController:self];
    [self setValue:customTabBar forKey:@"tabBar"];
    [self addChildControllers];
}

- (void)addChildControllers{
    [self addChildViewController:[[GXHomeController alloc] init] imageNormalName:@"homePage_unselect" imageSelectedName:@"homePage_select" title:@"首页"];
    [self addChildViewController:[[GXDiscoverController alloc] init] imageNormalName:@"homePage_unselect" imageSelectedName:@"homePage_select" title:@"行情"];
    [self addChildViewController:[[GXPlusController alloc] init] imageNormalName:@"homePage_unselect" imageSelectedName:@"homePage_select" title:@"直播"];
    [self addChildViewController:[[GXMsgController alloc] init] imageNormalName:@"homePage_unselect" imageSelectedName:@"homePage_select" title:@"发现"];
    [self addChildViewController:[[GXMineController alloc] init] imageNormalName:@"homePage_unselect" imageSelectedName:@"homePage_select" title:@"我"];
}

- (void)addChildViewController:(UIViewController *)childController imageNormalName:(NSString *)normalName imageSelectedName: (NSString *)selectedName title: (NSString *)title{
    GXNavigationController *nav = [[GXNavigationController alloc] initWithRootViewController:childController];
    childController.tabBarItem.image = [[UIImage imageNamed:normalName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.title = title;
    [self addChildViewController:nav];
}

@end

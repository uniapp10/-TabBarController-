//
//  GXNavigationController.m
//  demo
//
//  Created by yangfutang on 16/5/9.//test
//  Copyright © 2016年 yangfutang. All rights reserved.
//

#import "GXNavigationController.h"

@interface GXNavigationController ()

@end

@implementation GXNavigationController

+ (void)initialize {
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:[UIColor orangeColor]];
    [navBar setTranslucent:true];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end

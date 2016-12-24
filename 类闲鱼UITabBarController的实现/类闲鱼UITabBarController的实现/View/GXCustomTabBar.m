//
//  GXNewTabBar.m
//  GXAppNew
//
//  Created by zhudong on 2016/12/6.
//  Copyright © 2016年 futang yang. All rights reserved.
//

#import "GXCustomTabBar.h"
#import "GXCustomTabBarButton.h"

@interface GXCustomTabBar ()
@property (nonatomic, assign) NSInteger index;
@property (nonatomic,strong) GXCustomTabBarButton *customTabBarBtn;
@property (nonatomic,weak) UITabBarController *tabBarC;
@end

@implementation GXCustomTabBar

- (instancetype)initWithImageName: (NSString *)imageName title:(NSString *)title tabBarController: (UITabBarController *)tabBarC{
    self = [super init];
    if (self) {
        GXCustomTabBarButton *customTabBarBtn = [GXCustomTabBarButton buttonWithType:UIButtonTypeCustom];
        [customTabBarBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [customTabBarBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [customTabBarBtn setTitle:title forState:UIControlStateNormal];
        [customTabBarBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [self addSubview:customTabBarBtn];
        CGRect rect = CGRectMake(0, 0, GXScreenWidth / 5, BtnH + OffsetY);
        customTabBarBtn.frame = CGRectOffset(rect, 2 * GXScreenWidth / 5, -OffsetY);
        self.customTabBarBtn = customTabBarBtn;
        self.tabBarC = tabBarC;
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIView *subV in self.subviews) {
        if ([subV isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (self.index == 2) {
                [subV removeFromSuperview];
            }
            self.index++;
        }
        else if([subV isKindOfClass:NSClassFromString(@"_UIBarBackground")]){
            [subV removeFromSuperview];
        }
        else if ([subV isKindOfClass:[UIImageView class]] && (subV.frame.size.height < 5)){
            [subV removeFromSuperview];
        }
    }
    //解决navigationController采用pop方式跳转后, 系统会自动增加tabBarButton
    self.index = 0;
}
- (void)btnClick: (GXCustomTabBarButton *) btn{
    btn.selected = true;
    self.tabBarC.selectedIndex = 2;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGPoint convertPoint = [self convertPoint:point toView:self.customTabBarBtn];
    CGPoint convertToSelf = [self convertPoint:point toView:self];
    if ([self.customTabBarBtn pointInside:convertPoint withEvent:event]) {
        return self.customTabBarBtn;
    }else if ([self pointInside:convertToSelf withEvent:event]){
        self.customTabBarBtn.selected = false;
    }
    return [super hitTest:point withEvent:event];
}
@end

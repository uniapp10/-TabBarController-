//
//  GXNewTabBarButton.m
//  GXAppNew
//
//  Created by zhudong on 2016/12/6.
//  Copyright © 2016年 futang yang. All rights reserved.
//

#import "GXCustomTabBarButton.h"

@implementation GXCustomTabBarButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:TitleFont];
        [self setTitleColor:TitleColor forState:UIControlStateNormal];
        [self setTitleColor:TitleSelectedColor forState:UIControlStateSelected];
    }
    return self;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, BtnH - TitleH + OffsetY, GXScreenWidth / 5, TitleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, GXScreenWidth / 5, BtnH - TitleH);
}

@end

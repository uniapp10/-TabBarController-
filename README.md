# -TabBarController-
一句话实现闲鱼/转转TabBarController的效果,非常方便

1在tabBarController的viewDidLoad方法中,添加如下代码:
- (void)viewDidLoad {
[super viewDidLoad];

GXCustomTabBar *customTabBar = [[GXCustomTabBar alloc] initWithImageName:@"dis_liveCast" title:@"直播" tabBarController:self];
[self setValue:customTabBar forKey:@"tabBar"];
}
2若需要改变中间按钮的大小/偏移距离/颜色/选中颜色,请在PrefixHeader.pch文件中更改;
3总结:
>1用KVC的方式设置customTabBar;
>2添加CustomBtn到customTabBar;
>3在customTabBar中用hitTest拦截点击,处理选中的ViewController;
>4在customTabBar的layoutSubView方法中移除系统的UITabBarButton和上方的间隔线;
>5抽取代码实现,使功能相对独立,方便重用;

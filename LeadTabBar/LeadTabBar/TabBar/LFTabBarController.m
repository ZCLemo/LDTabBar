//
//  LFTabBarController.m
//  LeadbankFoundation
//
//  Created by 安军锋 on 16/5/23.
//  Copyright © 2016年 利得财富. All rights reserved.
//

#import "LFTabBarController.h"
#import "LFTabBarView.h"

@interface LFTabBarController ()<LFTabBarViewDelegate>

@property (nonatomic,strong) LFTabBarView *tabBarView;

@end

@implementation LFTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initCustomTabbarView];
    
}

/**
 *  加载自定义tabbar界面到系统tabbar
 */

- (void)initCustomTabbarView
{
    CGRect rect = self.tabBar.bounds;
    self.tabBarView = [[LFTabBarView alloc] init];
    self.tabBarView.frame = rect;
    self.tabBarView.delegate = self;
    self.tabBarView.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:self.tabBarView];
}

/**
 *  防止系统tabbar按钮显示
 */
-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self removeSystemBarItem];
}
/**
 *  防止系统tabbar按钮显示
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self removeSystemBarItem];
}


/**
 *  移除系统自动生成tabbar
 */
- (void)removeSystemBarItem
{
    for (UIView *child in self.tabBar.subviews)
    {
        if (![child isKindOfClass:[LFTabBarView class]])
        {
            [child removeFromSuperview];
        }
    }
}



- (void)setDataSource:(LFTabBarDataSource *)dataSource
{
    if (!dataSource) {
        return;
    }
    
    _dataSource = dataSource;
    
    for (NSString *name in _dataSource.viewcontrollerNames) {
        Class viewController = NSClassFromString(name);
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)[[viewController alloc] init]];
        [self addChildViewController:nav];
    }
    
    [self.tabBarView addItemViewsWithDataSource:_dataSource];
}


#pragma mark - LFTabBarViewDelegate

- (void)tabBar:(LFTabBarView *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}


@end

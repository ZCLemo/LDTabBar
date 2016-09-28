//
//  LFTabBarController.h
//  LeadbankFoundation
//
//  Created by 安军锋 on 16/5/23.
//  Copyright © 2016年 利得财富. All rights reserved.
//  test

#import <UIKit/UIKit.h>
#import "LFTabBarDataSource.h"

@interface LFTabBarController : UITabBarController

@property (nonatomic,strong)LFTabBarDataSource *dataSource;

@end

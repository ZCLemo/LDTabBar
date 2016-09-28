//
//  LFTabBarView.h
//  LeadbankFoundation
//
//  Created by 安军锋 on 16/5/23.
//  Copyright © 2016年 利得财富. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFTabBarView;
@class LFTabBarDataSource;

@protocol LFTabBarViewDelegate <NSObject>

/**
 *  工具栏按钮被选中, 记录从哪里跳转到哪里. (方便以后做相应特效)
 */
- (void) tabBar:(LFTabBarView *)tabBar selectedFrom:(NSInteger) from to:(NSInteger)to;

@end

@interface LFTabBarView : UIView

@property (nonatomic,assign)id <LFTabBarViewDelegate> delegate;

/**
 *  根据数据源设置itemView
 *
 *  @param dataSource 数据源
 */
- (void)addItemViewsWithDataSource:(LFTabBarDataSource *)dataSource;

@end

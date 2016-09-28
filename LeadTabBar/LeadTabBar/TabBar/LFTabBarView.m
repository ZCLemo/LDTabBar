//
//  LFTabBarView.m
//  LeadbankFoundation
//
//  Created by 安军锋 on 16/5/23.
//  Copyright © 2016年 利得财富. All rights reserved.
//

#import "LFTabBarView.h"
#import "LFTabBarItemView.h"
#import "LFTabBarDataSource.h"

@interface LFTabBarView ()

/**
 *  记录选中的itemView
 */
@property (nonatomic, strong) LFTabBarItemView *selectedItemView;

/**
 *  细线
 */
@property (nonatomic, strong) UIView *lineV;


@end

@implementation LFTabBarView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.lineV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];
        self.lineV.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        [self addSubview:self.lineV];
    }
    return  self;
}

- (void)addItemViewsWithDataSource:(LFTabBarDataSource *)dataSource
{
    if (!dataSource) {
        return;
    }
    
    NSInteger count = dataSource.viewcontrollerNames.count;
    for (int i=0; i<dataSource.viewcontrollerNames.count; i++) {
        CGFloat x = i * self.bounds.size.width / count;
        CGFloat y = 0;
        CGFloat width = self.bounds.size.width / count;
        CGFloat height = self.bounds.size.height;
        
        LFTabBarItemView *itemView = [[LFTabBarItemView alloc] initWithFrame:CGRectMake(x, y, width, height)];
        itemView.tag = i;
        [itemView setButtonWithImageName:dataSource.normalImageNames[i] selectedImageName:dataSource.selectedImageNames[i]];
        
        __weak typeof(self) weakSelf = self;
        itemView.itemSelectedBlock = ^(LFTabBarItemView *selectedItemView){
            if (weakSelf.selectedItemView == selectedItemView) {
                return;
            }
            weakSelf.selectedItemView.isSelected = NO;
            selectedItemView.isSelected = YES;
            if ([weakSelf.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
                [weakSelf.delegate tabBar:weakSelf selectedFrom:weakSelf.selectedItemView.tag to:selectedItemView.tag];
            }
            weakSelf.selectedItemView = selectedItemView;
        };
        [self addSubview:itemView];
        
        if (i == 0) {
            self.selectedItemView = itemView;
            self.selectedItemView.isSelected = YES;
        }
    }
}



@end

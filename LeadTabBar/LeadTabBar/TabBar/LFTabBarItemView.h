//
//  LFTabBarItemView.h
//  LeadbankFoundation
//
//  Created by 安军锋 on 16/5/23.
//  Copyright © 2016年 利得财富. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFTabBarItemView;

typedef void (^ ItemSelectedBlock) (LFTabBarItemView *itemView);

@interface LFTabBarItemView : UIView

@property (nonatomic,copy)ItemSelectedBlock itemSelectedBlock;

/**
 *  设置按钮选状态图片
 *
 *  @param imageName         未选中
 *  @param selectedImageName 选中
 */
- (void)setButtonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

/**
 *  是否被选中
 */
@property (nonatomic,assign) BOOL isSelected;

@end

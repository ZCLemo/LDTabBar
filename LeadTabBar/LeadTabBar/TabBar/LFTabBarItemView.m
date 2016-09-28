//
//  LFTabBarItemView.m
//  LeadbankFoundation
//
//  Created by 安军锋 on 16/5/23.
//  Copyright © 2016年 利得财富. All rights reserved.
//

#import "LFTabBarItemView.h"

@interface LFTabBarItemView ()

@property (nonatomic,strong)UIButton *btn;

@end

@implementation LFTabBarItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.frame = self.bounds;
        [self.btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];

    }
    return self;
}

- (void)setButtonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    [self.btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.btn setImage:[UIImage imageNamed:selectedImageName]  forState:UIControlStateSelected];
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    self.btn.selected = _isSelected;
}

- (void)clickBtn:(UIButton *)button
{
    if (self.itemSelectedBlock) {
        self.itemSelectedBlock(self);
    }
}

@end

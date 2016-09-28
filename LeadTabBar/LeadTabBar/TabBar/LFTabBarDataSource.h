//
//  LFTabBarDataSource.h
//  LeadTabBar
//
//  Created by 赵琛 on 16/6/12.
//  Copyright © 2016年 赵琛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFTabBarDataSource : NSObject

//controllers数组
@property (nonatomic,strong)NSArray *viewcontrollerNames;
//默认图片数组
@property (nonatomic,strong)NSArray *normalImageNames;
//选中图片数组
@property (nonatomic,strong)NSArray *selectedImageNames;

@end

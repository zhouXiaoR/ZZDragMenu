//
//  UIView+Frame.h
//  WZLCodeLibrary
//
//  Created by wzl on 15/3/23.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat tail;
@property (nonatomic, assign) CGFloat middleX;
@property (nonatomic, assign) CGFloat middleY;


/**
 高效率切圆角

 @param corner 圆角类型
 @param corRadius 圆角尺寸大小
 */
-(void)clipRoundCorner:(UIRectCorner)corner size:(CGFloat)corRadius;
@end

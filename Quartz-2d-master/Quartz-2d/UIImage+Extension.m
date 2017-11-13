


//
//  UIImage+Extension.m
//  Quartz2d绘图
//
//  Created by 王博 on 16/4/18.
//  Copyright © 2016年 304studio. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
- (instancetype)waterWithBgImage:(UIImage *)bgImage andLogoImage:(UIImage *)logoImage
{
    // 1.开启位图上下文
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    // 2.绘制背景
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 3.绘制 logo
    [logoImage drawInRect:CGRectMake(0, 0, logoImage.size.width, logoImage.size.height)];
    
    // 4.从上下文中取得一个图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭位图上下文
    UIGraphicsEndImageContext();
    return newImage;
}

+ (instancetype)circleImageWithName:(NSString *)name boardWidth:(CGFloat)boardWidth borderColor:(UIColor *)boarderColor
{
    // 1.加载原图
    UIImage * oldImage = [UIImage imageNamed:name];
    
    // 2.开启位图上下文
    CGFloat imageW = oldImage.size.width + 2*boardWidth;
    CGFloat imageH = oldImage.size.height + 2*boardWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框
    [boarderColor set];
    CGFloat bigRadius = imageW *  0.5;
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_2_PI, 1);
    CGContextFillPath(ctx);
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - boardWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_2_PI, 1);
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(boardWidth, boardWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end

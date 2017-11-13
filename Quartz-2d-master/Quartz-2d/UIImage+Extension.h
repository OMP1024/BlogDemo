//
//  UIImage+Extension.h
//  Quartz2d绘图
//
//  Created by 王博 on 16/4/18.
//  Copyright © 2016年 304studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  水印效果
 *
 *  @param bgImage   背景图
 *  @param logoImage  logo图片
 *
 *  @return 水印图片
 */
- (instancetype)waterWithBgImage:(UIImage*)bgImage andLogoImage:(UIImage *)logoImage;
+ (instancetype)circleImageWithName:(NSString*)name boardWidth:(CGFloat)boardWidth borderColor:(UIColor *)boarderColor;
@end

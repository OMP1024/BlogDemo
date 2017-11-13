



//
//  UIView+Extension.m
//  Quartz2d绘图
//
//  Created by 王博 on 16/4/18.
//  Copyright © 2016年 304studio. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (UIImage *)getScreenView
{
    // 1.开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    
    // 2.将 layer 渲染到当前上下文中
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  截取 scrollView 的视图
 */
- (UIImage *)getScrollViewImage:(UIScrollView *)scrollView
{
    UIImage* image = nil;
    UIGraphicsBeginImageContext(scrollView.contentSize);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}

@end

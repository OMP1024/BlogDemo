


//
//  WBDrawView.m
//  Quartz2d绘图
//
//  Created by 王博 on 16/4/18.
//  Copyright © 2016年 304studio. All rights reserved.
//

#import "WBDrawView.h"

@implementation WBDrawView

// 只有在 drawRect 中才可以获取上下文
- (void)drawRect:(CGRect)rect
{
//    [self draw4Rect];
//    [self drawArc];
//    [self drawEllipse];
//    [self drawImage:@"1"];
//    [self drawString];
//    [self savectx];
//    [self drawCTM];
    [self drawPath];
}

/**
 *  划线
 */
- (void)drawLine{
    // 1.先获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    // 设置线的属性
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    [[UIColor redColor] set];
    
    // 设置画笔的起点
    CGContextMoveToPoint(ctx, 100, 50);
    CGContextAddLineToPoint(ctx, 200, 60);
    CGContextAddLineToPoint(ctx, 170, 80);
    CGContextClosePath(ctx);
    
    // 3.渲染到上下文
    //    CGContextStrokePath(ctx); // 边框
    CGContextFillPath(ctx); // 填充

}
/**
 *  画矩形
 */
- (void)draw4Rect{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.拼接路径
    CGContextAddRect(ctx, CGRectMake(50, 100, 200, 200));
    
//    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 0, 1);
    
    // 3.渲染到上下文
//    CGContextFillPath(ctx);
    CGContextStrokePath(ctx);
}
/**
 *  画圆弧
 */
- (void)drawArc{
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    CGContextAddArc(ctx, 100, 100, 50, 0, M_PI_2, 1);
    CGContextSetLineWidth(ctx, 4);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    
    // 3.渲染到上下文
    CGContextStrokePath(ctx);
}
/**
 *  画圆
 */
- (void)drawEllipse{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 20, 200, 200));
    CGContextSetLineWidth(ctx, 6);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextStrokePath(ctx);
}
/**
 *  画图
 *
 *  @param name <#name description#>
 */
- (void)drawImage:(NSString *)name
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIImage * image = [UIImage imageNamed:name];
    [image drawInRect:CGRectMake(0, 0, 150, 150)];
//    [image drawAsPatternInRect:CGRectMake(100, 100, 200, 200)];
    CGContextStrokePath(ctx);
}
/**
 *  画文字
 */
- (void)drawString{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    NSString * str = [NSString stringWithFormat:@"哈哈哈哈哈😄ha"];
    
    [str drawWithRect:CGRectMake(100, 100, 200, 200) options:NSStringDrawingUsesDeviceMetrics attributes:nil context:nil];
    
    CGContextStrokePath(ctx);
    
}

// 图形上下文栈
- (void)savectx{
    // 1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.将图形上下文放到栈中
    CGContextSaveGState(ctx);
    
    // 3.拼接路径
    CGContextSetLineWidth(ctx, 2);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 200, 150);
    
    // 4.渲染
    CGContextStrokePath(ctx);
    
    // 5.将图形上下文弹出栈
    CGContextRestoreGState(ctx);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 0, 1);
    CGContextMoveToPoint(ctx, 200, 100);
    CGContextAddLineToPoint(ctx, 300, 300);
    
    // 6.渲染
    CGContextStrokePath(ctx);
}

// 矩阵操作
- (void)drawCTM{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGContextRotateCTM(ctx, M_PI_4 * 0.3);
    CGContextScaleCTM(ctx, 0.8, 0.8);
    CGContextTranslateCTM(ctx, 230, 100);
    
    CGContextAddRect(ctx, CGRectMake(10, 10, 50, 50));
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextStrokePath(ctx);
    
    // 弹出
    CGContextRestoreGState(ctx);
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 100, 100));
    CGContextSetLineWidth(ctx, 3);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 0, 1);
    CGContextStrokePath(ctx);
}

/**
 *  ctx 默认有一个 path，默认路径都放到了 path 中
 */
- (void)drawPath{
    
    /*
        CGPathCreateMutable:创建一个可变路径，返回一个句柄
        CGPathMoveToPoint:起点
        CGPathAddLineToPoint:添加线
        CGContextAddPath:添加路径到上下文
        CGPathRelease:释放
        CGPathAddRect:向路径中添加矩形
     */
    
    // 1.获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.创建一个路径
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    // 2.1划线
    CGPathMoveToPoint(path1, NULL, 20, 20);
    CGPathAddLineToPoint(path1, NULL, 200, 200);
    
    // 3.把绘制的路径添加到上下文里
    CGContextAddPath(ctx, path1);
    
    // 4.创建一个新的路径
    CGMutablePathRef path2 = CGPathCreateMutable();
    // 5.往路径里添加圆形
    CGPathAddEllipseInRect(path2, NULL, CGRectMake(50, 50, 20, 200));
    // 把路径添加到上下文
    CGContextAddPath(ctx, path2);
    
    // 渲染
    CGContextStrokePath(ctx);
    
    // 释放路径
    CGPathRelease(path1);
    CGPathRelease(path2);
}

@end

# Quartz-2d
	·	绘图 CoreGraphics
	·	绘制思路
	·	 一、获得图形上下文
	•	CGContextRef ctx = UIGraphicsGetCurrentContext();
	·	二、拼接路径
	·	1、绘制线段
	·	1、线宽：CGContextSetLineWidth(ctx, 10);
	·	2、转折：CGContextSetLineJoin(ctx, kCGLineJoinRound);
	·	3、头尾：CGContextSetLineCap(ctx, kCGLineCapRound);
	·	3、颜色：CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);setRGBFill,set[[UIColor whiteColor]set]
	·	4、起点：CGContextMoveToPoint(ctx, 10, 10);
	·	5、添加一条线段到：CGContextAddLineToPoint(ctx, 100, 100);
	·	6、关闭路径：CGContextClosePath(ctx);
	·	2、绘制矩形
	·	1、CGContextAddRect(ctx, CGRectMake(10, 10, 150, 100));
	·	3、绘制圆弧：
	·	1、起点CGContextMoveToPoint(ctx, 100, 100);
	·	2、添加线条：CGContextAddLineToPoint(ctx, 100, 150);
	·	3、画圆CGContextAddArc(ctx, 100, 100, 50, -M_PI_2, M_PI, 1);
	·	4、CGContextClosePath(ctx);
	·	4、画圆：CGContextAddEllipseInRect(ctx, CGRectMake(50, 10, 100, 100))
	·	5、绘制图片
	·	1、[image drawInRect:CGRectMake(0, 0, 150, 150)];
	•	2、[image drawAsPatternInRect:CGRectMake(0, 0, 200, 200)]
	·	6、绘制文字 [str drawInRect:cubeRect withAttributes:attrs];
	·	7、剪裁
	·	1、绘制要剪裁的上下文形状
	·	2、剪裁：CGContextClip(ctx);
	·	以后在此上下文上显示的东西的范围就是绘制的形状
	·	8、重绘：[self setNeedsDisplay];
	·	9、动画：CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
	·	10、路径
	·	1、创建路径：CGMutablePathRef linePath = CGPathCreateMutable();
	·	2、拼接路径：CGPathMoveToPoint(linePath, NULL, 0, 0);
    CGPathAddLineToPoint(linePath, NULL, 100, 100);
	·	3、添加到上下文：CGContextAddPath(ctx, linePath);
	·	4、渲染完释放：CGPathRelease(linePath);
	·	三、渲染图形到上下文
	·	绘边：CGContextStrokePath(ctx);
	•	
	·	填充:CGContextFillPath(ctx);	
	·	图形上下文栈
	·	1、拷贝图形到栈：CGContextSaveGState(ctx);
	·	2、将栈顶的上下文出栈，替换当前的上下：CGContextRestoreGState(ctx);
	·	矩阵操作：
	·	1、缩放：CGContextScaleCTM(ctx, 0.5, 0.5);
	·	2、旋转：CGContextRotateCTM(ctx, M_PI_4 * 0.3);
	·	3、平移：CGContextTranslateCTM(ctx, 0, 150);
	·	水印
	·	1、位图上下文：UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
	·	2、画背景：[bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
	·	3、水印：[waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
	·	4、取得制作完的图片： UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	·	5、结束上下文：UIGraphicsEndImageContext();
	·	屏幕截图：
	·	1、开启位图上下文：UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
	·	2、将 layer 渲染到上下文：[view.layer renderInContext:UIGraphicsGetCurrentContext()];
	·	3、取出图片：UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	·	4、结束上下文：UIGraphicsEndImageContext();

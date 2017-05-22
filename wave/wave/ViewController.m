//
//  ViewController.m
//  wave
//
//  Created by 王博 on 17/5/8.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CAShapeLayer *waveShapeLayer;
@property (nonatomic, strong) CAShapeLayer *waveShapeLayerT;
@property (nonatomic, strong) CADisplayLink *waveDisplayLink;
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat waveSpeed;
@property (nonatomic, assign) CGFloat waveHeight;
@property (nonatomic, assign) CGFloat waveWidth;
@property (nonatomic, assign) CGFloat waveAmplitude;
@property (nonatomic, assign) CGFloat offsetXT;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.offsetX = 1;
    self.waveSpeed = 3;
    self.waveHeight = -10;
    self.waveWidth = self.view.frame.size.width;
    self.waveAmplitude = 10;
    self.offsetXT = 5;
    [self wave];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)wave{
    self.waveShapeLayer = [CAShapeLayer layer];
    self.waveShapeLayer.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
    self.waveShapeLayer.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.waveShapeLayer];
    
    self.waveShapeLayerT = [CAShapeLayer layer];
    self.waveShapeLayerT.frame = CGRectMake(0, 100, self.view.frame.size.width, 50);
    self.waveShapeLayerT.fillColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:self.waveShapeLayerT];
    
    self.waveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [self.waveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)getCurrentWave{
    //offsetX决定x位置，如果想搞明白可以多试几次
    self.offsetX += self.waveSpeed;
    //声明第一条波曲线的路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起始点
    CGPathMoveToPoint(path, nil, 0, self.waveHeight);
    
    CGFloat y = 0.f;
    //第一个波纹的公式
    for (float x = 0.f; x <= self.waveWidth ; x++) {
        y = self.waveAmplitude * sin((300 / self.waveWidth) * (x * M_PI / 180) - self.offsetX * M_PI / 270) + self.waveHeight*1;
        CGPathAddLineToPoint(path, nil, x, y);
        x++;
    }
    //把绘图信息添加到路径里
    CGPathAddLineToPoint(path, nil, self.waveWidth, 50);
    CGPathAddLineToPoint(path, nil, 0, 50);
    //结束绘图信息
    CGPathCloseSubpath(path);
    
    self.waveShapeLayer.path = path;
    //释放绘图路径
    CGPathRelease(path);
    
    /*
     *  第二个
     */
    self.offsetXT += self.waveSpeed;
    CGMutablePathRef pathT = CGPathCreateMutable();
    CGPathMoveToPoint(pathT, nil, 0, self.waveHeight+10);
    
    CGFloat yT = 0.f;
    for (float x = 0.f; x <= self.waveWidth ; x++) {
        yT = self.waveAmplitude*1.6 * sin((260 / self.waveWidth) * (x * M_PI / 180) - self.offsetXT * M_PI / 180) - 20;
        CGPathAddLineToPoint(pathT, nil, x, yT-10);
    }
    CGPathAddLineToPoint(pathT, nil, self.waveWidth, 50);
    CGPathAddLineToPoint(pathT, nil, 0, 50);
    CGPathCloseSubpath(pathT);
    self.waveShapeLayerT.path = pathT;
    CGPathRelease(pathT);
}


@end

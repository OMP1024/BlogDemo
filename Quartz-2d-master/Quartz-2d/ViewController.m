//
//  ViewController.m
//  Quartz-2d
//
//  Created by 王博 on 16/4/19.
//  Copyright © 2016年 304studio. All rights reserved.
//

#import "ViewController.h"
#import "WBDrawView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WBDrawView * drawView =[[WBDrawView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

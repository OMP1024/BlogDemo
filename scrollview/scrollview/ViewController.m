//
//  ViewController.m
//  scrollview
//
//  Created by abbott on 2017/12/8.
//  Copyright © 2017年 NIP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIScrollView * scrollview;
@property (nonatomic,strong) UIButton * resetBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollview = [[UIScrollView alloc] initWithFrame: self.view.bounds];
    self.scrollview.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 3);
    self.scrollview.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.scrollview];

    UIView * view1 = [[UIView alloc] initWithFrame:self.view.bounds];
    view1.backgroundColor = [UIColor greenColor];
    [self.scrollview addSubview:view1];

    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
    view2.backgroundColor = [UIColor orangeColor];
    [self.scrollview addSubview:view2];

    UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height * 2, self.view.bounds.size.width, self.view.bounds.size.height)];
    view3.backgroundColor = [UIColor cyanColor];
    [self.scrollview addSubview:view3];


    self.resetBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
    self.resetBtn.backgroundColor = [UIColor blueColor];
    [self.resetBtn addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.resetBtn];
}

- (void)reset {
    [self.scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
}


@end

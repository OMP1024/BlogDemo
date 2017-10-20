//
//  ViewController.m
//  tool
//
//  Created by 王博 on 2017/10/20.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

#import "ViewController.h"
#import <AdSupport/AdSupport.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *idfatext;
@property (weak, nonatomic) IBOutlet UITextField *Otext;
@property (weak, nonatomic) IBOutlet UITextField *subidtext;
@property (weak, nonatomic) IBOutlet UITextField *urltext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.idfatext.text = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}
- (IBAction)didclick:(id)sender {
    self.urltext.text = [NSString stringWithFormat:@"http://adnetwork.hadoopfinetech.com/adserver/click?a=100003&o=%@&advid=%@&subid=%@&affsub=",self.Otext.text,self.idfatext.text,self.subidtext.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

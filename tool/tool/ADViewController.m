//
//  ADViewController.m
//  tool
//
//  Created by abbott on 25/12/2017.
//  Copyright © 2017 NewsInPalm. All rights reserved.
//

#import "ADViewController.h"

@interface ADViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic,strong) UIWebView * webview;
@property (nonatomic,strong) UITextView * textview;
@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLRequest * urlrequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://hfcdn.tech/html/raw.html"]];
    [self.webview loadRequest:urlrequest];
    [self.contentView addSubview:self.webview];
    [self.contentView addSubview:self.textview];
    [self.textview setHidden:YES];
    [self.webview setHidden:NO];
}

- (UIWebView *)webview
{
    if (_webview == nil) {
        _webview = [[UIWebView alloc] initWithFrame:self.contentView.bounds];
        _webview.delegate = self;
    }
    return _webview;
}

- (UITextView *)textview
{
    if (_textview == nil) {
        _textview = [[UITextView alloc] initWithFrame:self.contentView.bounds];
        _textview.font = [UIFont systemFontOfSize:18];
        _textview.textColor = [UIColor blackColor];
    }
    return _textview;
}

- (IBAction)didClickWeb:(id)sender {
    [self.textview setHidden:YES];
    self.webview.hidden = NO;
    [self.webview reload];
}

- (IBAction)didClickHtml:(id)sender {
    [self.webview setHidden:YES];
    self.textview.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *lJs = @"document.documentElement.innerHTML";
    NSString * innerHtml = [webView stringByEvaluatingJavaScriptFromString:lJs];
    self.textview.text = innerHtml;
}

@end

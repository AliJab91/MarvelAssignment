//
//  WebLoaderViewController.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "WebLoaderViewController.h"
#import <WebKit/WebKit.h>
@interface WebLoaderViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebLoaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWebViewDelegate];
    [self fireWebRequest];
}

#pragma mark- FIRE THE WEB REQUEST
-(void)fireWebRequest {
    [self setWebViewDelegate];
    NSURLRequest *url = [NSURLRequest requestWithURL:[NSURL URLWithString:self.wikiUrl]];
    [self.webView loadRequest:url];
}

#pragma mark - SET WEB VIEW DELEGATE
-(void)setWebViewDelegate {
    self.webView.delegate = self;
}

#pragma mark - FIRE LOADER WHEN PAGE LOADING BEGINS
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self showLodader];
}

#pragma mark - DISMISS LOADER WHEN FINISH PAGE LOAD.
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideLoader];
}


@end

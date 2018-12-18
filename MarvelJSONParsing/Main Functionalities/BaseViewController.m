//
//  BaseViewController.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "BaseViewController.h"
#import <SVProgressHUD.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - SHOW LOADER
-(void)showLodader{
    [SVProgressHUD show];
}

#pragma mark - HIDE LOADER
-(void)hideLoader{
    [SVProgressHUD dismiss];
}

#pragma mark - FIRE ALERT
-(void)showAlertWithTitle:(NSString*)title message:(NSString*)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}



#pragma mark - GENERATE THE FINAL URL OF THE IMAGE
-(NSString *)getFinalURL:(NSString*)url extension:(NSString*)extension imageType:(NSString*)imageType {
    NSString* finalUrl = [NSString stringWithFormat:@"%@%@%@%@%@",url,@"/",imageType,@".",extension];
    return finalUrl;
}
@end

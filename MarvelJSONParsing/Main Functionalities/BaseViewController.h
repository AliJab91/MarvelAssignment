//
//  BaseViewController.h
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
-(void)showLodader;
-(void)hideLoader;
-(NSString *)getFinalURL:(NSString*)url extension:(NSString*)extension imageType:(NSString*)imageType;
-(void)showAlertWithTitle:(NSString*)title message:(NSString*)message;
@end

NS_ASSUME_NONNULL_END

//
//  DetailViewController.h
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResutlsArray.h"
#import "BaseViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <CoreData/CoreData.h>
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : BaseViewController
@property (strong,nonatomic)ResutlsArray* receivedResults;
@property (strong,nonatomic) NSManagedObject* receivedObject;
@end

NS_ASSUME_NONNULL_END

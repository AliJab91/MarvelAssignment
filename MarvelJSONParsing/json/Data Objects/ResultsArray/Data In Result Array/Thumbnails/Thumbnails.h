//
//  Thumbnails.h
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Verified.h"
NS_ASSUME_NONNULL_BEGIN

@interface Thumbnails : NSObject
@property(strong,nonatomic)NSString* path;
@property(strong,nonatomic)NSString* extension;
-(instancetype)initWithJson:(NSDictionary*)json;
@end

NS_ASSUME_NONNULL_END

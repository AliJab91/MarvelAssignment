//
//  APIRequests.h
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonData.h"
NS_ASSUME_NONNULL_BEGIN


@interface APIRequests : NSObject
+(void)getMarvelDataWithcompletionBlock:(void(^)(BOOL success,NSError *error,JsonData *data))completionBlock;
@end

NS_ASSUME_NONNULL_END

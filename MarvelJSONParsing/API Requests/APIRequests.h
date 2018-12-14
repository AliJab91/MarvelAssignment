//
//  APIRequests.h
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonData.h"
NS_ASSUME_NONNULL_BEGIN


@interface APIRequests : NSObject
+(void)getMarvelDataWithcompletionBlock:(void(^)(BOOL success,NSError *error,JsonData *data))completionBlock;
@end

NS_ASSUME_NONNULL_END

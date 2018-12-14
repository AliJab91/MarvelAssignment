//
//  DataObject.h
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Verified.h"
#import "ResutlsArray.h"
NS_ASSUME_NONNULL_BEGIN

@interface DataObject : NSObject
@property (nonatomic) NSInteger offSet;
@property (nonatomic) NSInteger limit;
@property (nonatomic) NSInteger total;
@property (nonatomic) NSInteger count;
@property (strong,nonatomic)NSArray *resutls;
-(instancetype)initWithJson:(NSDictionary*)json;
@end


NS_ASSUME_NONNULL_END

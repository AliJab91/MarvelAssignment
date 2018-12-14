//
//  Comics.h
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Verified.h"
#import "Items.h"
NS_ASSUME_NONNULL_BEGIN

@interface Comics : NSObject
@property(nonatomic) NSInteger available;
@property(nonatomic,strong) NSString* collectionURL;
@property (nonatomic)NSInteger returned;
@property(strong,nonatomic) NSArray* comicsItems;
-(instancetype)initWithJson:(NSDictionary*)json;
@end

NS_ASSUME_NONNULL_END

//
//  JsonData.h
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataObject.h"
#import "NSDictionary+Verified.h"

NS_ASSUME_NONNULL_BEGIN

@interface JsonData : NSObject
@property (nonatomic)NSInteger code;
@property (strong,nonatomic)NSString* status;
@property (strong,nonatomic)NSString* cpyRight;
@property (strong,nonatomic)NSString* attributeText;
@property (strong,nonatomic)NSString* attributedHTML;
@property (strong,nonatomic)NSString* eTag;
@property (strong,nonatomic) DataObject *dataObject;
-(instancetype)initWithJson:(NSDictionary*)json;
@end

NS_ASSUME_NONNULL_END

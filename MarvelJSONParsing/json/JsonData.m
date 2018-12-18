//
//  JsonData.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "JsonData.h"

@implementation JsonData
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if(self){
        self.code = [[json verfiedObjectForKey:@"code"] integerValue];
        self.status = [json verfiedObjectForKey:@"status"];
        self.cpyRight = [json verfiedObjectForKey:@"copyright"];
        self.attributeText = [json verfiedObjectForKey:@"attributionText"];
        self.attributedHTML = [json verfiedObjectForKey:@"attributionHTML"];
        self.eTag = [json verfiedObjectForKey:@"etag"];
        self.dataObject = [[DataObject alloc] initWithJson:json[@"data"]];
    }
    return self;
}

@end



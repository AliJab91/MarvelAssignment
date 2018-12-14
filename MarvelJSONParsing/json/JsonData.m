//
//  JsonData.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "JsonData.h"

@implementation JsonData
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if(self){
        self.code = [[json verifiedObjectForKey:@"code"] integerValue];
        self.status = [json verifiedObjectForKey:@"status"];
        self.cpyRight = [json verifiedObjectForKey:@"copyright"];
        self.attributeText = [json verifiedObjectForKey:@"attributionText"];
        self.attributedHTML = [json verifiedObjectForKey:@"attributionHTML"];
        self.eTag = [json verifiedObjectForKey:@"etag"];
        self.dataObject = [[DataObject alloc] initWithJson:json[@"data"]];
    }
    return self;
}

@end



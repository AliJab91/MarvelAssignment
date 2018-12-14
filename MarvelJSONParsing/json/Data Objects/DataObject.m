//
//  DataObject.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "DataObject.h"

@implementation DataObject
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self){
        self.offSet = [[json verifiedObjectForKey:@"offset"] integerValue];
        self.limit = [[json verifiedObjectForKey:@"limit"] integerValue];
        self.total = [[json verifiedObjectForKey:@"total"] integerValue];
        self.count = [[json verifiedObjectForKey:@"count"] integerValue];
        NSMutableArray *tempArray = [NSMutableArray new];
        for (NSDictionary *item in json[@"results"]){
            ResutlsArray *result = [[ResutlsArray alloc] initWithJson:item];
            [tempArray addObject:result];
        }
        self.resutls = [tempArray copy];
    }
    return self;
}
@end

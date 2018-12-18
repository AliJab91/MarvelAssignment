//
//  DataObject.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "DataObject.h"

@implementation DataObject
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self){
        self.offSet = [[json verfiedObjectForKey:@"offset"] integerValue];
        self.limit = [[json verfiedObjectForKey:@"limit"] integerValue];
        self.total = [[json verfiedObjectForKey:@"total"] integerValue];
        self.count = [[json verfiedObjectForKey:@"count"] integerValue];
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

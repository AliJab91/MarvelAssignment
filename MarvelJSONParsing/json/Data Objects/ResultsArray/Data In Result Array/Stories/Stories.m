//
//  Stories.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "Stories.h"

@implementation Stories
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if(self){
        self.available = [[json verifiedObjectForKey:@"available"] integerValue];
        self.collectionURL = [json verifiedObjectForKey:@"collectionURI"];
        self.returned = [[json verifiedObjectForKey:@"returned"] integerValue];
        NSMutableArray *tempArray = [NSMutableArray new];
        for (NSMutableDictionary *item in json[@"items"]){
            Items* subItem = [[Items alloc] initWithJson:item];
            [tempArray addObject:subItem];
        }
        self.storiesItems = [tempArray copy];
    }
    return self;
}
@end

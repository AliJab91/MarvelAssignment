//
//  Events.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "Events.h"

@implementation Events
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if(self){
        self.available = [[json verifiedObjectForKey:@"available"] integerValue];
        self.collectionURL = [json verifiedObjectForKey:@"collectionURI"];
        NSMutableArray *tempArray = [NSMutableArray new];
        for (NSDictionary *item in json[@"items"]) {
            Items *subItem = [[Items alloc] initWithJson:item];
            [tempArray addObject:subItem];
        }
        self.eventsItems = [tempArray copy];
    }
    return self;
}
@end

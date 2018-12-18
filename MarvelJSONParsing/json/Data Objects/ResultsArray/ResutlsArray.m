//
//  ResutlsArray.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "ResutlsArray.h"

@implementation ResutlsArray
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init] ;
    if(self){
        self.resultId = [[json verfiedObjectForKey:@"id"] integerValue];
        self.name = [json verfiedObjectForKey:@"name"];
        self.descript = [json verfiedObjectForKey:@"description"];
        self.modified = [json verfiedObjectForKey:@"modified"];
        self.resourceURL = [json verfiedObjectForKey:@"resourceURI"];
        self.events = [[Events alloc] initWithJson:json[@"events"]];
        self.comics = [[Comics alloc] initWithJson:json[@"comics"]];
        self.series = [[Series alloc] initWithJson:json[@"series"]];
        self.thumbnail = [[Thumbnails alloc] initWithJson:json[@"thumbnail"]];
        self.stories = [[Stories alloc] initWithJson:json[@"stories"]];
        NSMutableArray *tempArray = [NSMutableArray new];
        for (NSDictionary *item in json[@"urls"] ) {
            Urls *url = [[Urls alloc] initWithJson:item];
            [tempArray addObject:url];
        }
        self.urls = [tempArray copy];
    }
    return self;
}
@end

//
//  ResutlsArray.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "ResutlsArray.h"

@implementation ResutlsArray
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init] ;
    if(self){
        self.resultId = [[json verifiedObjectForKey:@"id"] integerValue];
        self.name = [json verifiedObjectForKey:@"name"];
        self.descript = [json verifiedObjectForKey:@"description"];
        self.modified = [json verifiedObjectForKey:@"modified"];
        self.resourceURL = [json verifiedObjectForKey:@"resourceURI"];
        self.events = [[Events alloc] initWithJson:json[@"events"]];
        self.comics = [[Comics alloc] initWithJson:json[@"comics"]];
        self.series = [[Series alloc] initWithJson:json[@"series"]];
       // self.urls = [[Urls alloc] initWithJson:json[@"urls"]];
        self.stories = [[Stories alloc] initWithJson:json[@"stories"]];
    }
    return self;
}
@end

//
//  Urls.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "Urls.h"

@implementation Urls
-(instancetype)initWithJson:(NSDictionary *)json{
    self = [super init];
    if(self) {
        self.type = [json verifiedObjectForKey:@"type"];
        self.url = [json verifiedObjectForKey:@"url"];
    }
    return self;
}
@end

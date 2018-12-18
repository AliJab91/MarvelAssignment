//
//  ComicsItems.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "Items.h"

@implementation Items
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if(self){
        self.resourceUrl = [json verfiedObjectForKey:@"resourceURI"];
        self.name = [json verfiedObjectForKey:@"name"];
    }
    return self;
}
@end

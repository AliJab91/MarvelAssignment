//
//  Thumbnails.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "Thumbnails.h"

@implementation Thumbnails
-(instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if(self){
        self.urlPath = [json verfiedObjectForKey:@"path"];
        self.extension = [json verfiedObjectForKey:@"extension"];
    }
    return self;
}
@end

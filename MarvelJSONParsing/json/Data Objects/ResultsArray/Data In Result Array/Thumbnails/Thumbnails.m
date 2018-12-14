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
        self.path = [json verifiedObjectForKey:@"path"];
        self.extension =[json verifiedObjectForKey:@"extension"];
    }
    return self;
}
@end

//
//  NSDictionary+Verified.m
//  ACT
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "NSDictionary+Verified.h"
#import <UIKit/UIKit.h>

@implementation NSDictionary (Verified)

- (id)verfiedObjectForKey:(NSString *)key {
    id object = [self objectForKey:key];
    if (object != [NSNull null]) {
        return [self objectForKey:key];
    } else {
        return @"";
    }
}

- (NSInteger)verifiedIntegerForKey:(NSString *)key {
    id object = [self objectForKey:key];
    if (object != [NSNull null]) {
        return [[self objectForKey:key] integerValue];
    } else {
        return 0;
    }
}
- (float)verifiedFloatForKey:(NSString *)key{
    id object = [self objectForKey:key];
    if(object != [NSNull null]){
        return [[self objectForKey:key]floatValue];
    }else{
        return 0;
    }
}

@end

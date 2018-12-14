//
//  NSDictionary+Verified.m
//
//  Created by Ali Jaber on 8/8/19.
//  Copyright © 2016 Ali Jaber. All rights reserved.
//

#import "NSDictionary+Verified.h"

@implementation NSDictionary (Verified)

- (id)verifiedObjectForKey:(NSString *)key {
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


- (id)verifiedFloatForKey:(NSString *)key {
    id object = [self valueForKey:key];
    if (![object isEqual:[NSNull null]]) {
        return [self valueForKey:key];
    }
    else return @"0";
}


@end

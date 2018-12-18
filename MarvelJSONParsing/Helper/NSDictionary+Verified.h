//
//  NSDictionary+Verified.h
//  ACT
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Verified)
- (id)verfiedObjectForKey:(NSString *)key;
- (NSInteger)verifiedIntegerForKey:(NSString *)key;
- (float)verifiedFloatForKey:(NSString *)key;
@end

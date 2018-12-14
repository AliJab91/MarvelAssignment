//
//  NSDictionary+Verified.h

//
//  Created by Ali jaber Jaber on 8/8/18.
//  Copyright © 2016 Ali jaber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Verified)
- (id)verifiedObjectForKey:(NSString *)key;
- (id)verifiedFloatForKey:(NSString *)key;
- (NSInteger)verifiedIntegerForKey:(NSString *)key;
@end

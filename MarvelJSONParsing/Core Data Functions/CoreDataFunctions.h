//
//  CoreDataFunctions.h
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataFunctions.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface CoreDataFunctions : NSObject
+(void)insertCharacter:(NSString *)name  characterId:(NSInteger)characterId wikiUrl:(NSString*)wikiUrl smallImgUrl:(NSString*)smallImgUrl largeImgUrl:(NSString*)largeImgUrl;
+(NSArray*)retrieveAllCharacters;
+(void)deleteAllEntity:(NSString *)entityName;
@end

NS_ASSUME_NONNULL_END

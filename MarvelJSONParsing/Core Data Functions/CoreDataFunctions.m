//
//  CoreDataFunctions.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "CoreDataFunctions.h"

@implementation CoreDataFunctions


#pragma mark - get all the leads
+(NSArray*)retrieveAllCharacters {
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Characters"];
    NSError *error ;
    NSArray *resultArray= [context executeFetchRequest:request error:&error];
    return resultArray;
}

#pragma mark- INSERT CHARACTERS INTO LOCALL DATABASE
+(void)insertCharacter:(NSString *)name  characterId:(NSInteger)characterId wikiUrl:(NSString*)wikiUrl smallImgUrl:(NSString*)smallImgUrl largeImgUrl:(NSString*)largeImgUrl {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    if(context == nil){
        return;
    }
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Characters" inManagedObjectContext:context];
    NSNumber *convertedCharacterId = @(characterId);
    [object setValue:name forKey:@"character_name"];
    [object setValue:convertedCharacterId forKey:@"character_id"];
    [object setValue:wikiUrl forKey:@"wikiUrl"];
    [object setValue:smallImgUrl forKey:@"charcter_smallImgUrl"];
    [object setValue:largeImgUrl forKey:@"character_largeImgUrl"];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }else {
        NSLog(@"success");
    }
}


#pragma mark- DELETE ALL ENTITIES FROM LOCAL DATABASE
+(void)deleteAllEntity:(NSString *)entityName{
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:entityName];
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects)
    {
        [context deleteObject:object];
    }
    error = nil;
    [context save:&error];
}

@end

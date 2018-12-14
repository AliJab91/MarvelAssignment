//
//  CoreDataFunctions.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "CoreDataFunctions.h"

@implementation CoreDataFunctions


#pragma mark - get all the leads
+(NSArray*)retrieveAllData {
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Leads"];
    NSError *error ;
    NSArray *resultArray= [context executeFetchRequest:request error:&error];
    return resultArray;
}

+(void)insertBusinessTypes:(NSString *)businessType businessId:(NSString *)businessId {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    if(context == nil){
        return;
    }
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"BusinessTypes" inManagedObjectContext:context];
    [object setValue:businessType forKey:@"business_type"];
    [object setValue:businessId forKey:@"type_id"];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }else {
        NSLog(@"success");
    }
    
}

+(void)insertImagesById:(NSMutableArray*)images {
    if(images.count == 0){
        return;
    }
    for (UIImage *image in images) {
        NSInteger savedUserId = [[NSUserDefaults standardUserDefaults]integerForKey:@"userId"];
        NSNumber *convertedUserId = @(savedUserId);
        NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
        NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Images"
                                                                inManagedObjectContext:context];
        NSUUID *uuid = [NSUUID UUID];
        NSString *uniqueId = [uuid UUIDString];
        NSData *data = UIImagePNGRepresentation(image);
        [object setValue:convertedUserId forKey:@"lead_id"];
        [object setValue:data forKey:@"image"];
        [object setValue:uniqueId forKey:@"image_id"];
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Failed to save - error: %@", [error localizedDescription]);
        }else {
            NSLog(@"success");
        }
    }
}

+(void)deleteRecordById:(NSInteger)userId {
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Leads" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lead_id == %d",userId];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *managedObject in items)
    {
        [context deleteObject:managedObject];
    }
}

+(void)deleteImagesById:(NSString *)uniqueId {
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Images" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"image_id == %@",uniqueId];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *managedObject in items)
    {
        [context deleteObject:managedObject];
    }
}

+(NSArray*)returnNumberOfImages:(NSInteger)userId {
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Images"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"lead_id == %d", userId]];
    NSError *error;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];
    return items;
}

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

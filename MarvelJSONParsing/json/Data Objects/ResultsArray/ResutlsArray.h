//
//  ResutlsArray.h
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Verified.h"
#import "Thumbnails.h"
#import "Urls.h"
#import "Series.h"
#import "Stories.h"
#import "Comics.h"
#import "Events.h"
NS_ASSUME_NONNULL_BEGIN

@interface ResutlsArray : NSObject
@property(nonatomic) NSInteger resultId;
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *descript;
@property(strong,nonatomic)NSString *modified;
@property(strong,nonatomic) NSString* resourceURL;
@property(strong,nonatomic) NSArray *urls;
@property(strong,nonatomic)Events *events;
@property(strong,nonatomic)Series* series;
@property(strong,nonatomic)Stories* stories;
@property(strong,nonatomic)Comics* comics;
@property(strong,nonnull) Thumbnails *thumbnail;
-(instancetype)initWithJson:(NSDictionary*)json;

@end

//"id": 1011334,
//"name": "3-D Man",
//"description": "",
//"modified": "2014-04-29T14:18:17-0400",
//"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
NS_ASSUME_NONNULL_END

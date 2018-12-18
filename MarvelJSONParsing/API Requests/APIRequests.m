//
//  APIRequests.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "APIRequests.h"
#import <AFNetworking.h>
#import <CommonCrypto/CommonDigest.h>
static NSString *const publicKey = @"6613d67d174bc5fc564fdcddd011f4f4";
static NSString *const privateKey = @"5c18dbf37d8a30410034b80088436f228f6310db";
@implementation APIRequests
#pragma mark - MAIN REQUEST
+ (void)makeGetRequestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters headers:(NSDictionary *)headers completionBlock:(void(^)(NSError *error, id responseObject))block {
    NSError *error;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:parameters error:&error];
    request.timeoutInterval = 25;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (block) {
            block(error, responseObject);
        }else {
            block(responseObject, error);
            return ;

        }
    }]resume];
}

#pragma mark - GENERATE TIMESTAMP
+(NSString*)generateTimeStamp {
    NSString * timeStampValue = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
    return timeStampValue;
}


#pragma mark - GENERATE HASH MD5 FROM TIMESTAMP AND BOTH PRIVATE AND PUBLIC KEY
+ (NSString *)generateMd5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}
     
#pragma mark - GET MARVEL CHARACTERS
+(void)getMarvelDataWithcompletionBlock:(void(^)(BOOL success,NSError *error,JsonData *data))completionBlock {
    NSInteger limitNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"limit"];
    if ((limitNumber == nil) || (limitNumber == 0)){
        limitNumber = 5;
        [[NSUserDefaults standardUserDefaults] setInteger:limitNumber forKey:@"limit"];
    }else {
        limitNumber += 5 ;
         [[NSUserDefaults standardUserDefaults] setInteger:limitNumber forKey:@"limit"];
    }
    NSString *timeStamp = [self generateTimeStamp];
    NSString* hashValue = [self generateMd5:[NSString stringWithFormat:@"%@%@%@",timeStamp,privateKey,publicKey]];
    //hash-> timestamp + private+public
    NSString *baseURL = @"https://gateway.marvel.com/v1/public/characters";
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    [parameters setValue:publicKey forKey:@"apikey"];
    [parameters setValue:hashValue forKey:@"hash"];
    [parameters setValue:timeStamp forKey:@"ts"];
    [parameters setValue:[NSString stringWithFormat:@"%ld", (long)limitNumber] forKey:@"limit"];
    [self makeGetRequestWithUrl:baseURL parameters:parameters headers:nil completionBlock:^(NSError *error, id responseObject) {
        BOOL success = [responseObject[@"status"] isEqualToString:@"Ok"] ? YES:NO ;
        if (success){
            JsonData *data = [[JsonData alloc] initWithJson:responseObject];
            if(completionBlock){
                completionBlock(success,nil,data);
            }
        }else {
            if(completionBlock) {
                completionBlock(NO,error,nil);
            }
        }
    }];
}

@end



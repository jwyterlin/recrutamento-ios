//
//  JWNetAPIClient.m
//  task
//
//  Created by Jhonathan Wyterlin on 02/10/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "JWNetAPIClient.h"

#import "Routes.h"

@implementation JWNetAPIClient

+(instancetype)sharedClient {
    
    static JWNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[JWNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:[Routes BASE_URL_API]]];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        
    });
    
    return _sharedClient;
}

@end

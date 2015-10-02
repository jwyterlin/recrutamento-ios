//
//  ShowDAO.m
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ShowDAO.h"

// Model
#import "ShowModel+Json.h"

@implementation ShowDAO

-(void)showsPopularWithCompletion:(void(^)(NSArray *shows, BOOL hasNoConnection, NSError *error))completion {
    
    [self showsPopularWithCompletion:^(NSArray *shows, BOOL hasNoConnection, NSError *error) {
        if (completion)
            completion(shows, hasNoConnection, error);
    } test:^(id responseData, NSError *error) {
        // Do nothing
    }];
    
}

-(void)showsPopularWithCompletion:(void(^)(NSArray *shows, BOOL hasNoConnection, NSError *error))completion
                         test:(void(^)(id responseData, NSError *error))test {
    
    Connection *con = [Connection new];
    
    NSNumber *page = [NSNumber numberWithInt:1];
    NSNumber *limit = [NSNumber numberWithInt:10];
    NSString *extendedImages = @"extended=images";
    
    NSString *url = [NSString stringWithFormat:@"%@?page=%i&limit=%i&%@",[Routes WS_SHOWS_POPULAR],[page intValue],[limit intValue],extendedImages];
    
    [con connectWithMethod:RequestMethodGet url:url parameters:nil success:^(id responseData) {
        
        if (test) {
            test(responseData,nil);
        }
        
        NSArray *results = (NSArray *)[responseData copy];
        
        NSArray *shows = [[ShowModel new] setupListWithJson:results];
        
        if ( completion ) {
            completion( shows, NO, nil );
        }
        
    } failure:^(BOOL hasNoConnection, NSError *error) {
        
        if (test) {
            test(nil,error);
        }
        
        if ( completion ) {
            completion(nil, hasNoConnection, error);
        }
        
    }];
    
}

@end

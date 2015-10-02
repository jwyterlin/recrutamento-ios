//
//  ShowDAO.m
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ShowDAO.h"

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
    
    [con connectWithMethod:RequestMethodGet url:[Routes WS_SHOWS_POPULAR] parameters:nil success:^(id responseData) {
        
        if (test) {
            test(responseData,nil);
        }
        
        NSArray *results = (NSArray *)[responseData copy];
        
        NSMutableArray *shows = [NSMutableArray new];
        
        for ( NSDictionary *json in results ) {
            
            // TODO:
            //
            // Mount objects
            NSLog( @"json: %@", json );
            
        }
        
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

//
//  ShowDAO.h
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GenericDAO.h"

@interface ShowDAO : GenericDAO

// Shows - Popular
-(void)showsPopularWithCompletion:(void(^)(NSArray *shows, BOOL hasNoConnection, NSError *error))completion;

-(void)showsPopularWithCompletion:(void(^)(NSArray *shows, BOOL hasNoConnection, NSError *error))completion
                             test:(void(^)(id responseData, NSError *error))test;

@end

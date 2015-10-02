//
//  GenericModel.h
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Validator.h"

@interface GenericModel : NSObject

-(NSArray *)setupListWithJson:(NSArray *)list;
-(id)setupWithJson:(NSDictionary *)json;

@end

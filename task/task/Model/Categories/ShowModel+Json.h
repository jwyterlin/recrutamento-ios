//
//  ShowModel+Json.h
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShowModel.h"

@interface ShowModel (Json)

-(ShowModel *)setupWithJson:(NSDictionary *)json;

@end

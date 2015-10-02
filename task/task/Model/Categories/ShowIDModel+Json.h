//
//  ShowIDModel+Json.h
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ShowIDModel.h"

@interface ShowIDModel (Json)

-(ShowIDModel *)setupWithJson:(NSDictionary *)json;

@end

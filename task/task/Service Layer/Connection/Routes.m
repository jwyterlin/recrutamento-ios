//
//  Routes.m
//  task
//
//  Created by Jhonathan Wyterlin on 02/10/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Routes.h"

@implementation Routes

+(NSString *)BASE_URL {
    
    // Over SSL
    return @"https://api-v2launch.trakt.tv";
    
    // Staging
    // return @"http://api.staging.trakt.tv";
    
}

+(NSString *)BASE_URL_API {
    return [NSString stringWithFormat:@"%@",[Routes BASE_URL]];
}

@end

//
//  ShowModel+Json.m
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ShowModel+Json.h"
#import "ShowIDModel+Json.h"

@implementation ShowModel (Json)

/*
 
 {
    "title": "Band of Brothers",
    "year": 2001,
    "ids": {
        "trakt": 4589,
        "slug": "band-of-brothers",
        "tvdb": 74205,
        "imdb": "tt0185906",
        "tmdb": 4613,
        "tvrage": 2708
    }
 }
 
 */

-(ShowModel *)setupWithJson:(NSDictionary *)json {
    
    if ( ! [Validator validateObject:json] )
        return nil;
    
    ShowModel *showModel = [ShowModel new];
    
    showModel.title = json[@"title"];
    showModel.year = [NSNumber numberWithInt:[json[@"year"] intValue]];
    
    ShowIDModel *showIDModel = [[ShowIDModel new] setupWithJson:json[@"ids"]];
    showModel.showID = showIDModel;
    
    return showModel;
    
}

@end

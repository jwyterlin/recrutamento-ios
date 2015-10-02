//
//  ShowIDModel+Json.m
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ShowIDModel+Json.h"

@implementation ShowIDModel (Json)

/*

 {
    "trakt": 4589,
    "slug": "band-of-brothers",
    "tvdb": 74205,
    "imdb": "tt0185906",
    "tmdb": 4613,
    "tvrage": 2708
 }

*/

-(ShowIDModel *)setupWithJson:(NSDictionary *)json {
    
    if ( ! [Validator validateObject:json] )
        return nil;
    
    ShowIDModel *showIDModel = [ShowIDModel new];
    
    if ( [Validator validateObject:json[@"trakt"]] )
        showIDModel.trakt = [NSNumber numberWithInt:[json[@"trakt"] intValue]];
    
    if ( [Validator validateObject:json[@"slug"]] )
        showIDModel.slug = json[@"slug"];
    
    if ( [Validator validateObject:json[@"tvdb"]] )
        showIDModel.tvdb = [NSNumber numberWithInt:[json[@"tvdb"] intValue]];
    
    if ( [Validator validateObject:json[@"imdb"]] )
        showIDModel.imdb = json[@"imdb"];
    
    if ( [Validator validateObject:json[@"tmdb"]] )
        showIDModel.tmdb = [NSNumber numberWithInt:[json[@"tmdb"] intValue]];
    
    if ( [Validator validateObject:json[@"tvrage"]] )
        showIDModel.tvrage = [NSNumber numberWithInt:[json[@"tvrage"] intValue]];
    
    return showIDModel;
    
}

@end

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

-(ShowModel *)setupWithJson:(NSDictionary *)json {
    
    if ( ! [Validator validateObject:json] )
        return nil;
    
    ShowModel *showModel = [ShowModel new];
    
    // Title
    showModel.title = json[@"title"];
    
    // Year
    showModel.year = [NSNumber numberWithInt:[json[@"year"] intValue]];
    
    // IDs
    ShowIDModel *showIDModel = [[ShowIDModel new] setupWithJson:json[@"ids"]];
    showModel.showID = showIDModel;
    
    // Images
    if ( [Validator validateObject:json[@"images"]] ) {
        
        NSDictionary *images = json[@"images"];
        
        // Banner
        showModel.urlImageBanner = [self urlOfJson:images forKey:@"banner"];
        
        // Clear Art
        showModel.urlImageClearArt = [self urlOfJson:images forKey:@"clearart"];
        
        // Fan Art ( full, medium, thumb )
        showModel.urlImageFanArt = [self urlOfJson:images forKey:@"fanart"];
        
        // Logo
        showModel.urlImageLogo = [self urlOfJson:images forKey:@"logo"];
        
        // Poster ( full, medium, thumb )
        showModel.urlImagePoster = [self urlOfJson:images forKey:@"poster"];
        
        // Thumb
        showModel.urlImageThumb = [self urlOfJson:images forKey:@"thumb"];
        
    }
    
    return showModel;
    
}

#pragma mark - Private methods

-(NSString *)urlOfJson:(NSDictionary *)json forKey:(NSString *)key {
    
    if ( [Validator validateObject:json[key]] ) {
        
        NSDictionary *dictionary = json[key];
        
        if ( [Validator validateObject:dictionary[@"full"]] )
            return dictionary[@"full"];
        
    }
    
    return nil;
    
}

@end

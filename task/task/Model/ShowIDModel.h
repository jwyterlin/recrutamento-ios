//
//  ShowIDModel.h
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "GenericModel.h"

@interface ShowIDModel : GenericModel

@property(nonatomic,strong) NSNumber *trakt;
@property(nonatomic,strong) NSString *slug;
@property(nonatomic,strong) NSNumber *tvdb;
@property(nonatomic,strong) NSString *imdb;
@property(nonatomic,strong) NSNumber *tmdb;
@property(nonatomic,strong) NSNumber *tvrage;

@end

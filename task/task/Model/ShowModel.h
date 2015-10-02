//
//  ShowModel.h
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "GenericModel.h"

@class ShowIDModel;

@interface ShowModel : GenericModel

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSNumber *year;
@property(nonatomic,strong) ShowIDModel *showID;
@property(nonatomic,strong) UIImage *image;

@end

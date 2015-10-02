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
@property(nonatomic,strong) UIImage *imageBanner;
@property(nonatomic,strong) UIImage *imageClearArt;
@property(nonatomic,strong) UIImage *imageFanArt;
@property(nonatomic,strong) UIImage *imageLogo;
@property(nonatomic,strong) UIImage *imagePoster;
@property(nonatomic,strong) UIImage *imageThumb;
@property(nonatomic,strong) NSString *urlImageBanner;
@property(nonatomic,strong) NSString *urlImageClearArt;
@property(nonatomic,strong) NSString *urlImageFanArt;
@property(nonatomic,strong) NSString *urlImageLogo;
@property(nonatomic,strong) NSString *urlImagePoster;
@property(nonatomic,strong) NSString *urlImageThumb;

@end

//
//  ShowCollectionViewCell.h
//  task
//
//  Created by Jhonathan Wyterlin on 01/10/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCollectionViewCell : UICollectionViewCell

@property(strong,nonatomic) IBOutlet UIImageView *imageShow;
@property(strong,nonatomic) IBOutlet UILabel *title;
@property(strong,nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property(strong,nonatomic) IBOutlet UILabel *noImage;

@end

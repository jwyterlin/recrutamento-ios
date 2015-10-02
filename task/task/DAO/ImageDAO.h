//
//  ImageDAO.h
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GenericDAO.h"

@interface ImageDAO : GenericDAO

-(void)imageByUrl:(NSString *)url completion:(void(^)(UIImage *image))completion;

@end

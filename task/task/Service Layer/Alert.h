//
//  Alert.h
//  task
//
//  Created by Jhonathan Wyterlin on 10/2/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface Alert : NSObject

-(UIAlertController *)showAlertMessage:(NSString *)message viewController:(UIViewController *)viewController;

-(void)showError:(NSError *)error viewController:(UIViewController *)viewController;

-(void)showNoConnectionWithViewController:(UIViewController *)viewController;

@end

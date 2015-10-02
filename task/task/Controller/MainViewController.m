//
//  MainViewController.m
//  task
//
//  Created by Jhonathan Wyterlin on 01/10/15.
//  Copyright © 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "MainViewController.h"

// Cell
#import "ShowCollectionViewCell.h"

// DAO
#import "ShowDAO.h"

@interface MainViewController()

@property(nonatomic,strong) NSArray *shows;

@end

@implementation MainViewController

static NSString * const reuseIdentifier = @"ShowCollectionViewCell";

#pragma mark - View Lifecycle

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    [self downloadShows];
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shows.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
-(BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {

	return NO;

}

-(BOOL)collectionView:(UICollectionView *)collectionView 
     canPerformAction:(SEL)action 
   forItemAtIndexPath:(NSIndexPath *)indexPath 
           withSender:(id)sender {
 
	return NO;
 
}

-(void)collectionView:(UICollectionView *)collectionView 
        performAction:(SEL)action 
   forItemAtIndexPath:(NSIndexPath *)indexPath 
           withSender:(id)sender {
	
}
 
*/

#pragma mark - Private methods

-(void)downloadShows {
    
    [[ShowDAO new] showsPopularWithCompletion:^(NSArray *shows, BOOL hasNoConnection, NSError *error) {
       
        if ( hasNoConnection ) {
            // TODO:
            //
            // Show No Connection
            return;
        }
        
        if ( error ) {
            // TODO:
            //
            // Show error
        }
        
        // Success
        
    }];
    
}

@end

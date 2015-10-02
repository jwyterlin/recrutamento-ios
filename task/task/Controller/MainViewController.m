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
#import "ImageDAO.h"

// Model
#import "ShowModel.h"

// Service Layer
#import "Alert.h"

@interface MainViewController()

@property(nonatomic,strong) NSArray *shows;

@property(nonatomic,strong) UIRefreshControl *refresh;

@end

@implementation MainViewController

static NSString * const reuseIdentifier = @"ShowCollectionViewCell";

#pragma mark - View Lifecycle

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Register cell classes
    UINib *nib = [UINib nibWithNibName:reuseIdentifier bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView addSubview:self.refresh];
    
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
    
    ShowModel *show = self.shows[indexPath.row];
    
    [cell.loading stopAnimating];
    cell.noImage.hidden = YES;
    
    cell.title.text = show.title;
    cell.imageShow.backgroundColor = [UIColor blackColor];

    if ( show.imagePoster ) {
        
        cell.imageShow.image = show.imagePoster;
        return cell;
        
    }
    
    cell.imageShow.image = nil;
    
    [cell.loading startAnimating];
    
    [[ImageDAO new] imageByUrl:show.urlImagePoster completion:^(UIImage *image) {
        
        [cell.loading stopAnimating];

        ShowCollectionViewCell *helperCell = (ShowCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
        if ( helperCell ) {
            
            helperCell.noImage.hidden = (image != nil);
            
            if ( image ) {
                
                show.imagePoster = image;
                helperCell.imageShow.image = image;
                
            }
            
        }
        
    }];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake( 180, 329 );
}

#pragma mark - Private methods

-(void)downloadShows {
    
    [[ShowDAO new] showsPopularWithCompletion:^(NSArray *shows, BOOL hasNoConnection, NSError *error) {
       
        [self.refresh endRefreshing];
        
        if ( hasNoConnection ) {
            
            // Show No Connection
            [[Alert new] showNoConnectionWithViewController:self];
            return;
            
        }
        
        if ( error ) {
            
            // Show error
            [[Alert new] showError:error viewController:self];
            return;
            
        }
        
        // Success
        self.shows = shows;
        
        [self.collectionView reloadData];
        
    }];
    
}

#pragma mark - Lazy instances

-(UIRefreshControl *)refresh {
    
    if ( ! _refresh ) {
        
        _refresh = [UIRefreshControl new];
        [_refresh addTarget:self action:@selector(downloadShows) forControlEvents:UIControlEventValueChanged];
        _refresh.tintColor = [UIColor lightGrayColor];
        
    }
    
    return _refresh;
    
}

@end

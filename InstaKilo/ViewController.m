//
//  ViewController.m
//  InstaKilo
//
//  Created by Stefan Verveniotis on 2016-11-16.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "PhotoObject.h"
#import "PhotoManager.h"

@interface ViewController () <PhotoManagerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPickerView *sortPicker;
@property (nonatomic, strong) PhotoManager * photos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photos = [PhotoManager new];
    self.photos.delegate = self;
    [self.photos.sortedArray addObject:[NSMutableArray arrayWithArray:self.photos.photos]];
    self.sortPicker.dataSource = self.photos;
    self.sortPicker.delegate = self.photos;
    [self.sortPicker selectRow:0 inComponent:0 animated:NO];
    self.collectionView.delegate = self.photos;
    self.collectionView.dataSource = self.photos;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(self.view.bounds.size.width/2, self.view.bounds.size.width/2);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) refreshCollectionView {
    [self.collectionView reloadData];
}


@end

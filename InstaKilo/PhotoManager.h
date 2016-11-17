//
//  PhotoManager.h
//  InstaKilo
//
//  Created by Stefan Verveniotis on 2016-11-16.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoObject.h"
#import "CollectionViewCell.h"
#import "PhotoHeaderView.h"

@protocol PhotoManagerDelegate <NSObject>

- (void) refreshCollectionView;

@end

@interface PhotoManager : NSObject <
UICollectionViewDelegate,
UICollectionViewDataSource,
UIPickerViewDataSource,
UIPickerViewDelegate>

@property (nonatomic) NSArray <PhotoObject *> * photos;
@property (nonatomic) NSString * sortMethod;
@property (nonatomic) NSMutableArray <NSMutableArray *> * sortedArray;
@property (nonatomic) NSArray * sorterOptions;

@property (nonatomic, weak) id<PhotoManagerDelegate> delegate;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

@end

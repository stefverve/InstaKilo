//
//  PhotoManager.m
//  InstaKilo
//
//  Created by Stefan Verveniotis on 2016-11-16.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "PhotoManager.h"

@interface PhotoManager ()

@end

@implementation PhotoManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photos = @[[[PhotoObject alloc] initWithName:@"chairs.jpg" subject:@"Thing" location:@"Toronto"],
                   [[PhotoObject alloc] initWithName:@"creeper.jpg" subject:@"Thing" location:@"Home"],
                   [[PhotoObject alloc] initWithName:@"femaleface.jpg" subject:@"Thing" location:@"Toronto"],
                   [[PhotoObject alloc] initWithName:@"jellyfish.jpg" subject:@"Weird Ocean Thing" location:@"Toronto"],
                   [[PhotoObject alloc] initWithName:@"maleface.jpg" subject:@"Thing" location:@"Toronto"],
                   [[PhotoObject alloc] initWithName:@"metric1.jpg" subject:@"Concert" location:@"St. Catherines"],
                   [[PhotoObject alloc] initWithName:@"metric2.jpg" subject:@"Concert" location:@"St. Catherines"],
                   [[PhotoObject alloc] initWithName:@"metric3.jpg" subject:@"Concert" location:@"St. Catherines"],
                   [[PhotoObject alloc] initWithName:@"portrait.jpg" subject:@"Me" location:@"Home"],
                   [[PhotoObject alloc] initWithName:@"tree.jpg" subject:@"Thing" location:@"Home"]];
        _sortMethod = @"default";
        _sorterOptions = @[@"default", @"subject", @"location"];
        _sortedArray = [NSMutableArray new];
    }
    return self;
}

#pragma mark - delegate protocols

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sortedArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sortedArray[section].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *id = @"cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id forIndexPath:indexPath];
    PhotoObject * newPhoto = self.sortedArray[indexPath.section][indexPath.row];
    [cell showImage:newPhoto.image];
    return cell;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%@", self.sorterOptions[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.sortMethod = self.sorterOptions[row];
    self.sortedArray = [NSMutableArray new];
    NSMutableArray *sortStrings = [NSMutableArray new];
    int sortIndex = 0;
    if (row == 1) {
        for (PhotoObject *photo in self.photos) {
            if (![sortStrings containsObject:photo.subject]) {
                [sortStrings addObject:photo.subject];
            }
        }
        for (NSString *sorter in sortStrings) {
            for (PhotoObject *photo in self.photos) {
                if ([photo.subject isEqualToString:sorter]) {
                    if (self.sortedArray.count <= sortIndex) {
                        [self.sortedArray addObject:[NSMutableArray new]];
                    }
                    [self.sortedArray[sortIndex] addObject:photo];
                }
            }
            sortIndex++;
        }
    } else if (row == 2) {
        for (PhotoObject *photo in self.photos) {
            if (![sortStrings containsObject:photo.location]) {
                [sortStrings addObject:photo.location];
            }
        }
        for (NSString *sorter in sortStrings) {
            for (PhotoObject *photo in self.photos) {
                if ([photo.location isEqualToString:sorter]) {
                    if (self.sortedArray.count <= sortIndex) {
                        [self.sortedArray addObject:[NSMutableArray new]];
                    }
                    [self.sortedArray[sortIndex] addObject:photo];
                }
            }
            sortIndex++;
        }
    } else if (row == 0) {
        [self.sortedArray addObject:[NSMutableArray arrayWithArray:self.photos]];
    }
    [self.delegate refreshCollectionView];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        PhotoHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        if ([self.sortMethod isEqualToString:@"default"]) {
            headerView.photoHeaderLabel.text = @"Default View";
            return headerView;
        }
        PhotoObject *p = self.sortedArray[indexPath.section][0];
        headerView.photoHeaderLabel.text = [p valueForKey:self.sortMethod];
        reusableview = headerView;
    }
    return reusableview;
}

@end

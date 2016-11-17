//
//  CollectionViewCell.m
//  InstaKilo
//
//  Created by Stefan Verveniotis on 2016-11-16.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photo;


@end


@implementation CollectionViewCell

- (void)showImage:(UIImage*)image {
    self.photo.image = image;
}

@end

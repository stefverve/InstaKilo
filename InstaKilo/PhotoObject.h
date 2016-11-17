//
//  PhotoObject.h
//  InstaKilo
//
//  Created by Stefan Verveniotis on 2016-11-16.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoObject : NSObject

@property (nonatomic) NSString * subject;
@property (nonatomic) NSString * location;
@property (nonatomic) UIImage * image;

- (instancetype)initWithName:(NSString *)name subject:(NSString *)subject location:(NSString *)location;

@end

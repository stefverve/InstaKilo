//
//  PhotoObject.m
//  InstaKilo
//
//  Created by Stefan Verveniotis on 2016-11-16.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "PhotoObject.h"

@implementation PhotoObject

- (instancetype)initWithName:(NSString *)name subject:(NSString *)subject location:(NSString *)location {
    self = [super init];
    if (self) {
        _image = [UIImage imageNamed:name];
        _subject = subject;
        _location = location;
    }
    return self;
}

@end

//
//  City.h
//  CodeChallenge2
//
//  Created by Amaeya Kalke on 10/10/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) NSString *stateOrProvince;
@property (strong, nonatomic) NSMutableArray *cityArray;
@property UIImage *image;

@end

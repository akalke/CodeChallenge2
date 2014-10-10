//
//  CItyViewController.h
//  CodeChallenge2
//
//  Created by Amaeya Kalke on 10/10/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "City.h"

@interface CItyViewController : UIViewController

@property (nonatomic, strong) City *city;
@property (nonatomic, strong) NSMutableArray *citiesArray;

@end

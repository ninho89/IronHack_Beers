//
//  Beer.h
//  BeerBrowser
//
//  Created by Alessandro on 13/10/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject

// 1st: properties
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic) NSUInteger alcoholGrade;

// class methods
+ (Beer *)beerWithName:(NSString *)name;
+ (Beer *)beer;

// inits
- (instancetype) initWithName:(NSString *)brand;

// 2nd class citizens

@end

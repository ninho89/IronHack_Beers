//
//  Beers.h
//  BeerBrowser
//
//  Created by Alessandro on 13/10/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Beer;

@interface Beers : NSObject

-(instancetype)initFromData:(NSData *)data;

- (instancetype)initFromJSONFile:(NSString *)filePath;
-(instancetype)initFromJSONUrl:(NSURL *)url;
- (instancetype)initFromPlistFile:(NSString *)filePath;


- (void) addBeer:(Beer * )beer;
- (NSArray *)allBeers;
- (NSUInteger)count;

@end

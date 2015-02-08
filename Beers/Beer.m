//
//  Beer.m
//  BeerBrowser
//
//  Created by Alessandro on 13/10/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import "Beer.h"

@implementation Beer

+ (Beer *)beerWithName:(NSString *)name {
    return [[Beer alloc] initWithName:name];
}

+ (Beer *)beer {
    return [self beerWithName:@"hksdjha"];
}

- (instancetype)init
{
	return [self initWithName:nil];
}

- (instancetype) initWithName:(NSString *)brand{
	if ( (self = [super init]) && brand) {
		_name = brand;
		return self;
	}
	
	return nil;
}

@end

//
//  Beers.m
//  BeerBrowser
//
//  Created by Alessandro on 13/10/14.
//  Copyright (c) 2014 Alessandro. All rights reserved.
//

#import "Beers.h"
#import "Beer.h"

@interface Beers ()

@property (nonatomic, strong) NSMutableArray *beersDatabase;

@end

@implementation Beers

-(instancetype)initFromData:(NSData *)data{
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    NSError * __autoreleasing error;
    NSArray *jsonObjects = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (jsonObjects) {
        for (NSDictionary *dict in jsonObjects) {
            Beer *beer = [[Beer alloc] initWithName:dict [@"Brand"] ];
            beer.country = dict[@"Country"];
            beer.alcoholGrade = [dict[@"Alcohol"] unsignedIntegerValue];
            beer.imageUrl = dict [@"ImageUrl"];
            
            [self.beersDatabase addObject:beer];
        }
    }
    
    return self;
}

- (instancetype)initFromJSONFile:(NSString *)filePath {
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    return  [self initFromData:data];
}

-(instancetype)initFromJSONUrl:(NSURL *)url{
    NSData *data = [NSData dataWithContentsOfURL:url];
    return  [self initFromData:data];
}

- (instancetype)initFromPlistFile:(NSString *)filePath {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    NSArray *plistContent = [[NSArray alloc] initWithContentsOfFile:filePath];
    [plistContent enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *beerData = (NSDictionary *)obj;
        Beer *b = [[Beer alloc] initWithName:beerData[@"Brand"]];
        b.country = beerData[@"Country"];
        b.alcoholGrade = [beerData[@"Alcohol"] integerValue];
        b.imageUrl = beerData[@"ImageUrl"];
        
        [self.beersDatabase addObject:b];
    }];
    
    return self;
}


- (NSMutableArray *)beersDatabase{
    if (!_beersDatabase) {
        _beersDatabase = [[NSMutableArray alloc] init];
    }
    
    return _beersDatabase;
}

- (void) addBeer:(Beer * )beer{
    if (![self beerInDatabase:beer]) {
        [self.beersDatabase addObject:beer];
    }
}

- (NSArray *)allBeers{
    return [NSArray arrayWithArray:self.beersDatabase];
}

- (BOOL) beerInDatabase:(Beer *)otherBeer{
    for (Beer *b in self.beersDatabase) {
        if ([b.name isEqualToString:otherBeer.name]) {
            return YES;
        }
    }
    
    return NO;
}

- (NSUInteger)count{
    return self.beersDatabase.count;
}

@end

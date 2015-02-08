//
//  ViewController.m
//  Beers
//
//  Created by Filippo Aresu on 5/2/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "BeerViewController.h"

@interface BeerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *beerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *beerCountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *beerAlcoholLAbel;
@property (weak, nonatomic) IBOutlet UIImageView *beersImage;
@end

@implementation BeerViewController

-(void) setBeer:(Beer *)beer{
    
    [_beer removeObserver:self forKeyPath:@"name"];
    _beer = beer;
    [_beer addObserver:self forKeyPath:@"name" options:0 context:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.beerNameLabel.text = self.beer.name;
    self.beerCountryLabel.text = self.beer.country;
    self.beerAlcoholLAbel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.beer.alcoholGrade];
    
//    self.beersImage.image = [UIImage imageNamed:@"cerveza-polar-pilsen"];
    
//    self.beersImage.image = [UIImage imageNamed:@"cerveza-polar-pilsen@2x.png"];
//    self.beersImage.image = [UIImage imageNamed:@"cerveza-polar-pilsen@3x.png"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        
        NSURL *url = [NSURL URLWithString:self.beer.imageUrl];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.beersImage.image = [UIImage imageWithData:imageData];
        });

    });

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
//    NSURL *url = [NSURL URLWithString:self.beer.imageUrl];
//    NSData *imageData = [NSData dataWithContentsOfURL:url];
//    self.beersImage.image = [UIImage imageWithData:imageData];

}
- (IBAction)updateAction {
    
    self.beer.name = @"Changed";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
            self.beerNameLabel.text = self.beer.name;
}

@end

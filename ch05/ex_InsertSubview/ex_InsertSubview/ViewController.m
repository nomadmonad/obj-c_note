//
//  ViewController.m
//  ex_InsertSubview
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *house;
}
@property (strong, nonatomic) IBOutlet UIView *field;
- (IBAction)insertHouse:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *houseImage = [UIImage imageNamed:@"house.png"];
    CGRect rect = CGRectMake(0, 0, houseImage.size.width, houseImage.size.height);
    house = [[UIImageView alloc] initWithFrame:rect];
    house.image = houseImage;
    house.contentMode = UIViewContentModeTopLeft;
    house.center = CGPointMake(68 + (houseImage.size.width / 2), 67 + (houseImage.size.height / 2));
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insertHouse:(id)sender {
    [_field insertSubview:house atIndex:1];
}
@end

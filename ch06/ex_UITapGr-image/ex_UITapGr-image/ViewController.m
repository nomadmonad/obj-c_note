//
//  ViewController.m
//  ex_UITapGr-image
//
//  Created by tyamamo on 2014/04/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *tombo;
- (IBAction)tapTombo:(UITapGestureRecognizer *)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapTombo:(UITapGestureRecognizer *)sender {
    CGFloat tomboWidth = _tombo.bounds.size.width;
    CGFloat tomboHeight = _tombo.bounds.size.height;
    
    NSInteger w = floor(self.view.bounds.size.width - tomboWidth);
    NSInteger h = floor(self.view.bounds.size.height - tomboHeight);
    
    CGFloat x = (arc4random() % w) + (tomboWidth / 2);
    CGFloat y = (arc4random() % h) + (tomboHeight / 2);
    
    _tombo.center = CGPointMake(x, y);
}
@end

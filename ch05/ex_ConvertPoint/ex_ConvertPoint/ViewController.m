//
//  ViewController.m
//  ex_ConvertPoint
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *field;
@property (strong, nonatomic) IBOutlet UIImageView *tombo;
@property (strong, nonatomic) IBOutlet UIImageView *ring;
- (IBAction)catchTombo:(id)sender;

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

- (IBAction)catchTombo:(id)sender {
    CGPoint pt = [self.view convertPoint:_tombo.center fromView:_field];
    _ring.center = pt;
}
@end

//
//  ViewController.m
//  ex_UIPanGRDrag_Center
//
//  Created by tyamamo on 2014/04/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *tombo;
- (IBAction)dragging:(UIPanGestureRecognizer *)sender;

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

- (IBAction)dragging:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self.view];
    CGPoint homeloc = _tombo.center;
    homeloc.x += translation.x;
    homeloc.y += translation.y;
    _tombo.center = homeloc;
    [sender setTranslation:CGPointZero inView:self.view];
    translation = [sender translationInView:self.view];
}
@end

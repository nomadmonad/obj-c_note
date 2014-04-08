//
//  ViewController.m
//  ex_UISwipeGR
//
//  Created by tyamamo on 2014/04/08.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)swipeView:(UISwipeGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UIView *frontView;
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

- (IBAction)swipeView:(UISwipeGestureRecognizer *)sender {
    CGPoint location = _frontView.center;
    CGFloat center_x = self.view.center.x;
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        location.x = center_x + 120;
    } else if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        location.x = center_x;
    }
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         _frontView.center = location;
                     }];
}
@end

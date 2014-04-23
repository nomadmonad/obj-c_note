//
//  ViewController.m
//  ex_UIView_transitionWithView
//
//  Created by tyamamo on 2014/04/21.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int no;
}
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)tapView:(UITapGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	no = 0;
    _myLabel.text = [NSString stringWithFormat:@"%d", no];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapView:(UITapGestureRecognizer *)sender {
    [UIView transitionWithView:_myView
                      duration:4
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _myLabel.text = [NSString stringWithFormat:@"%d", ++no];
                    }
                    completion:nil];
}
@end

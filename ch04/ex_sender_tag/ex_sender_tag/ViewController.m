//
//  ViewController.m
//  ex_sender_tag
//
//  Created by tyamamo on 2014/04/04.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
- (IBAction)touchWordButton:(UIButton *)sender;

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

- (IBAction)touchWordButton:(UIButton *)sender {
    NSString *word;
    switch (sender.tag) {
        case 10:
            word = @"flower";
            break;
        case 11:
            word = @"bird";
            break;
        case 12:
            word = @"wind";
            break;
        case 13:
            word = @"moon";
            break;
        default:
            break;
    }
    _wordLabel.text = word;
}
@end

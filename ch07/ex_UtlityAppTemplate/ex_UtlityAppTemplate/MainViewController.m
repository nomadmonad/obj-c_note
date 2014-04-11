//
//  MainViewController.m
//  ex_UtlityAppTemplate
//
//  Created by tyamamo on 2014/04/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    NSMutableDictionary *mainViewDic;
}
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *myImage;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    mainViewDic[@"user"] = @"未設定";
    mainViewDic [@"date"] = [NSDate date];
    mainViewDic[@"switch"] = @YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) configureView
{
    _messageLabel.text = [NSString stringWithFormat:@"こんにちは、%@さん", mainViewDic[@"user"]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年mm月dd日"];
    _dateLabel.text = [formatter stringFromDate:mainViewDic[@"date"]];
    
    _myImage.hidden = ![mainViewDic[@"switch"] boolValue];
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller configDic:(NSMutableDictionary *)dic
{
    
    if (mainViewDic == nil) {
        mainViewDic = [NSMutableDictionary dictionaryWithCapacity:3];
    }
    
    [mainViewDic addEntriesFromDictionary:dic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end

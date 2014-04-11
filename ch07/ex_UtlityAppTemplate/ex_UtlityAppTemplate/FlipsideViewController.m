//
//  FlipsideViewController.m
//  ex_UtlityAppTemplate
//
//  Created by tyamamo on 2014/04/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()
{
    NSMutableDictionary *flipSideDic;
}

@property (strong, nonatomic) IBOutlet UITextField *messageText;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UISwitch *imageSwitch;
- (IBAction)tapView:(UITapGestureRecognizer *)sender;

- (void)configureView;

@end

@implementation FlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    flipSideDic[@"user"] = _messageText.text;
    flipSideDic[@"date"] = _datePicker.date;
    flipSideDic[@"switch"] = @(_imageSwitch.on);
    [self.delegate flipsideViewControllerDidFinish:self configDic:flipSideDic];
}

- (void)configureView
{
    _messageText.text = flipSideDic[@"user"];
    _datePicker.date = flipSideDic[@"date"];
    _imageSwitch.on = [flipSideDic[@"switch"] boolValue];
}

- (void)setConfigureDic:(NSMutableDictionary *)configDic
{
    if (flipSideDic == nil) {
        flipSideDic = [NSMutableDictionary dictionary];
    }
    [flipSideDic addEntriesFromDictionary:configDic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapView:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}
@end

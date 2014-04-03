//
//  ViewController.m
//  ch03
//
//  Created by tyamamo on 2014/04/03.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)switchOnOff:(UISwitch *)sender {
    if (sender.on == YES) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)ArraySetupButton:(id)sender {
    NSArray *devices = @[@"ipod", @"iPhone", @"iPad"];
    NSLog(@"devices = %@", devices);
    
    NSString *lastDevice = [devices lastObject];
    NSLog(@"配列の最後の要素は、%@", lastDevice);
}

- (IBAction)mutableArraySetup:(id)sender {
    NSMutableArray *devices = [NSMutableArray array];
    [devices addObject:@"iPod"];
    [devices addObjectsFromArray:@[@"iPhone", @"iPad"]];
    NSLog(@"MutableArray devices = %@", devices);
}
@end

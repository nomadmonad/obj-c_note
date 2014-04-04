//
//  ViewController.h
//  ex_IBAction1
//
//  Created by tyamamo on 2014/04/04.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)updateValue:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

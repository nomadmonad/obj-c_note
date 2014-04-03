//
//  ViewController.h
//  ch03
//
//  Created by tyamamo on 2014/04/03.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ResultField;
- (IBAction)switchOnOff:(id)sender;
- (IBAction)ArraySetupButton:(id)sender;
- (IBAction)mutableArraySetup:(id)sender;
- (IBAction)nsDictionaySetup:(id)sender;

@end

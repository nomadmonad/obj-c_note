//
//  ViewController.m
//  ex_UIAlertView_textInput
//
//  Created by tyamamo on 2014/04/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)tapButton:(id)sender;

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

- (IBAction)tapButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"パスワードを入力してください。"
                                                    message:@"英数6文字以上です"
                                                   delegate:self
                                          cancelButtonTitle:@"キャンセル"
                                          otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"Cancelled.");
    } else if (buttonIndex == 1) {
        UITextField *field = [alertView textFieldAtIndex:0];
        NSLog(@"Inputted: %@", field.text);
    }
}
@end

//
//  ViewController.m
//  ex_NSString_writeToFile
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGRect originalFrame;
}
@property (strong, nonatomic) IBOutlet UITextView *myTextView;
- (IBAction)editCancel:(id)sender;
- (IBAction)editDone:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadFile];
    
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification addObserver:self
                     selector:@selector(keyboardDidShow:)
                         name:UIKeyboardDidShowNotification
                       object:nil];
    [notification addObserver:self
                     selector:@selector(keyboardDidHide:)
                         name:UIKeyboardDidHideNotification
                       object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    originalFrame = _myTextView.frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editCancel:(id)sender {
    [self loadFile];
    [self.view endEditing:YES];
}

- (IBAction)editDone:(id)sender {
    [self saveFile];
    [self.view endEditing:YES];
}

- (void)loadFile
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/note.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:filePath]) {
        _myTextView.text = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSUTF8StringEncoding
                                                        error:NULL];
    } else {
        NSLog(@"file not found.");
        _myTextView.text = nil;
    }
}

- (void)saveFile
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/note.txt"];
    [_myTextView.text writeToFile:filePath
                       atomically:YES
                         encoding:NSUTF8StringEncoding
                            error:NULL];
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary *infoDic = [notification userInfo];
    CGRect keyBoardFrame = [infoDic[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect textViewFrame = _myTextView.frame;
    textViewFrame.size.height = originalFrame.size.height - keyBoardFrame.size.height;
    _myTextView.frame = textViewFrame;
}

- (void)keyboardDidHide:(NSNotification *)notification
{
    _myTextView.frame = originalFrame;
}
@end

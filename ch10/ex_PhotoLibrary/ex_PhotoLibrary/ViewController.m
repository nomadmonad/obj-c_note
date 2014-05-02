//
//  ViewController.m
//  ex_PhotoLibrary
//
//  Created by tyamamo on 2014/05/02.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)selsectPhoto:(UIBarButtonItem *)sender;

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

- (IBAction)selsectPhoto:(UIBarButtonItem *)sender {
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* editedImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
    UIImage* sunImage = [UIImage imageNamed:@"sun640"];
    
    CGSize theSize = CGSizeMake(640, 640);
    CGRect theRect = CGRectMake(0, 0, 640, 640);
    
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

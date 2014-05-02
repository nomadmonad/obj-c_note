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
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* editedImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
    UIImage* sunImage = [UIImage imageNamed:@"sun640"];
    
    CGSize theSize = CGSizeMake(640, 640);
    CGRect theRect = CGRectMake(0, 0, 640, 640);
    float posX = (theSize.width - editedImage.size.width) / 2;
    float posY = (theSize.height - editedImage.size.height) / 2;
    
    UIGraphicsBeginImageContext(theSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextStrokeRect(context, theRect);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, theRect);
    [editedImage drawInRect:CGRectMake(posX, posY, editedImage.size.width, editedImage.size.height)];
    
    [sunImage drawInRect:CGRectMake(0, 0, sunImage.size.width, sunImage.size.height)];
    
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(result, nil, nil, nil);
    _myImageView.image = result;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

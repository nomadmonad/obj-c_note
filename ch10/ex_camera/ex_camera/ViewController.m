//
//  ViewController.m
//  ex_camera
//
//  Created by tyamamo on 2014/05/02.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UISwitch *originalSaveSwitch;
- (IBAction)startCamera:(UIBarButtonItem *)sender;

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

- (IBAction)startCamera:(UIBarButtonItem *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = YES;
        
        [self presentViewController:imagePicker
                           animated:YES
                         completion:nil];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* originalImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage* editedImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
    _myImageView.image = editedImage;
    
    UIImageWriteToSavedPhotosAlbum(editedImage, nil, nil, nil);
    
    if (_originalSaveSwitch.on) {
        UIImageWriteToSavedPhotosAlbum(originalImage, nil, nil, nil);
    }
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end

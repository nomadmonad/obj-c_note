//
//  ViewController.m
//  ex_UIView_transition
//
//  Created by tyamamo on 2014/04/18.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *timer;
    NSArray *photoNames;
    int photoIndex;
}
@property (weak, nonatomic) IBOutlet UIImageView *myPhoto;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UIPickerView *transitionPicker;

- (void)goNextPhoto;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    photoNames = @[@"funaya.jpg", @"kabe.jpg", @"uminoie.jpg"];
    photoIndex = 0;
    
    _caption.text = photoNames[photoIndex];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:3
                                             target:self
                                           selector:@selector(goNextPhoto)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goNextPhoto
{
    if (photoIndex < (photoNames.count - 1)) {
        photoIndex++;
    } else {
        photoIndex = 0;
    }
    
    UIImageView *fromView = _myPhoto;
    
    UIImage *nextPhoto = [UIImage imageNamed:photoNames[photoIndex]];
    UIImageView *toView = [[UIImageView alloc] initWithImage:nextPhoto];
    
    toView.frame = fromView.frame;
    
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCurlUp
                    completion:nil];
    
    _myPhoto = toView;
    _caption.text = photoNames[photoIndex];
}

@end

//
//  ViewController.m
//  ex_UIScrollView
//
//  Created by tyamamo on 2014/04/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;



- (CGRect) zoomRectForScale:(float)scale withCenter:(CGPoint)center;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _myScrollView.delegate =self;
    
    _myScrollView.minimumZoomScale = 1;
    _myScrollView.maximumZoomScale = 8;
    
    _myScrollView.scrollEnabled = YES;
    _myScrollView.showsHorizontalScrollIndicator = YES;
    _myScrollView.showsVerticalScrollIndicator = YES;
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    _myImageView.userInteractionEnabled = YES;
    [_myImageView addGestureRecognizer:doubleTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _myImageView;
}

- (void) doubleTap:(UITapGestureRecognizer *) gesture
{
    if (_myScrollView.zoomScale < _myScrollView.maximumZoomScale) {
        float newScale = _myScrollView.zoomScale * 3;
        CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gesture locationInView:gesture.view]];
        [_myScrollView zoomToRect:zoomRect animated:YES];
    } else {
        [_myScrollView setZoomScale:1.0 animated:YES];
    }
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
{
    CGRect zoomRect;
    zoomRect.size.height = [_myScrollView frame].size.height / scale;
    zoomRect.size.width = [_myScrollView frame].size.width / scale;
    
    zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}

@end

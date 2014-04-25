//
//  ViewController.m
//  ex_UIDA_Gravity_Collision_lineBound
//
//  Created by tyamamo on 2014/04/24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "DrawLine.h";

@interface ViewController ()
{
    NSTimer* timerObj;
}

@property (nonatomic, strong) UIDynamicAnimator* animator;
@property (nonatomic, strong) UIDynamicItemBehavior* itemBehavior;
@property (nonatomic, strong) UIGravityBehavior* gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior* collisionBehavior;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 	CGPoint line1Start = CGPointMake(270, 100);
    CGPoint line1End  = CGPointMake(160, 200);
    CGPoint line2Start = CGPointMake(60, 230);
    CGPoint line2End  = CGPointMake(200, 350);
    
    CGRect frame = self.view.frame;
    DrawLine* line1 = [[DrawLine alloc] initWithFrame:frame startPoint:line1Start endPoint:line1End];
    DrawLine* line2 = [[DrawLine alloc] initWithFrame:frame startPoint:line2Start endPoint:line2End];
    [self.view addSubview:line1];
    [self.view addSubview:line2];
    
    NSArray* items = nil;
    self.itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    self.itemBehavior.density = 0.5;
    self.itemBehavior.elasticity = 1.0;
    self.itemBehavior.friction = 0.5;
    self.itemBehavior.resistance = 0.2;
    
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:items];
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:items];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.collisionBehavior addBoundaryWithIdentifier:(id<NSCopying>)@"line1" fromPoint:(CGPoint)line1Start toPoint:(CGPoint)line1End];
    [self.collisionBehavior addBoundaryWithIdentifier:(id<NSCopying>)@"line2" fromPoint:(CGPoint)line2Start toPoint:(CGPoint)line2End];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self.animator addBehavior:self.itemBehavior];
    [self.animator addBehavior:self.gravityBehavior];
    [self.animator addBehavior:self.collisionBehavior];
    
    timerObj = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                target:self
                                              selector:@selector(addFrog)
                                              userInfo:nil
                                               repeats:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addFrog
{
    UIImage* frogImage = [UIImage imageNamed:@"frog.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:frogImage];
    imageView.center = CGPointMake(250, 20);
    [self.view addSubview:imageView];
    
    [self.itemBehavior addItem:imageView];
    [self.gravityBehavior addItem:imageView];
    [self.collisionBehavior addItem:imageView];
    
    if(self.itemBehavior.items.count >= 10) {
        [timerObj invalidate];
    }
}
@end

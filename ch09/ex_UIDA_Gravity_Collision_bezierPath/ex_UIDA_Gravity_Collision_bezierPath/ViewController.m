//
//  ViewController.m
//  ex_UIDA_Gravity_Collision_bezierPath
//
//  Created by tyamamo on 2014/04/25.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "DrawBezierPath.h"

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
	
    CGPoint startPoint = CGPointMake(55, 250);
    CGPoint endPoint = CGPointMake(260, 310);
    CGPoint controlPoint = CGPointMake(130, 130);
    
    UIBezierPath* bazierPath = [UIBezierPath bezierPath];
    [bazierPath moveToPoint:startPoint];
    [bazierPath addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    CGRect frame = self.view.frame;
    DrawBezierPath* curve = [[DrawBezierPath alloc] initWithFrame:frame bezierPath:bazierPath];
    [self.view addSubview:curve];
    
    NSArray* items = nil;
    
    _itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    _itemBehavior.density = 0.5;
    _itemBehavior.elasticity = 1.0;
    _itemBehavior.friction = 0.5;
    _itemBehavior.resistance = 0.2;
    
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:items];
    _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:items];
    _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [_collisionBehavior addBoundaryWithIdentifier:@"curve" forPath:bazierPath];
    
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [_animator addBehavior:_itemBehavior];
    [_animator addBehavior:_gravityBehavior];
    [_animator addBehavior:_collisionBehavior];
    
    timerObj = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                target:self
                                              selector:@selector(addFrog)
                                              userInfo:(nil)
                                               repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addFrog
{
    UIImage* image = [UIImage imageNamed:@"frog.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    CGFloat x = (arc4random() % 70) + 80.0;
    imageView.center = CGPointMake(x, 20);
    [self.view addSubview:imageView];
    
    [_itemBehavior addItem:imageView];
    [_gravityBehavior addItem:imageView];
    [_collisionBehavior addItem:imageView];
    
    if (_itemBehavior.items.count > 10) {
        [timerObj invalidate];
    }
}
@end

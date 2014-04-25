//
//  ViewController.m
//  ex_UIDA_Gravity_Collision_Push
//
//  Created by tyamamo on 2014/04/25.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer* timerObj;
}
@property (nonatomic, strong) UIDynamicAnimator* animator;
@property (nonatomic, strong) UIDynamicItemBehavior* itemBehavior;
@property (nonatomic, strong) UIGravityBehavior* gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior* collisionBehavior;
@property (nonatomic, strong) UIPushBehavior* pushBehavior;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray* items = nil;
    
    _itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    _itemBehavior.density = 1.0;
    _itemBehavior.elasticity = 0.3;
    _itemBehavior.friction = 0.5;
    _itemBehavior.resistance = 0.8;
    
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:items];
    
    _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:items];
    _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    _pushBehavior = [[UIPushBehavior alloc]initWithItems:items mode:UIPushBehaviorModeInstantaneous];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [_animator addBehavior:_itemBehavior];
    [_animator addBehavior:_gravityBehavior];
    [_animator addBehavior:_collisionBehavior];
    [_animator addBehavior:_pushBehavior];
    
    timerObj = [NSTimer scheduledTimerWithTimeInterval:1.5
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

- (void)addFrog
{
    UIImage* image = [UIImage imageNamed:@"frog.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    CGFloat y = self.view.frame.size.height;
    imageView.center = CGPointMake(50, y - 100);
    [self.view addSubview:imageView];
    
    if (_pushBehavior.items.count > 0) {
        [_pushBehavior removeItem:_pushBehavior.items[0]];
        _pushBehavior.active = YES;
    }
    
    _pushBehavior.angle = -M_PI / 4;
    _pushBehavior.magnitude = 1 * ((arc4random() % 10) * 0.1);
    
    [_itemBehavior addItem:imageView];
    [_gravityBehavior addItem:imageView];
    [_collisionBehavior addItem:imageView];
    [_pushBehavior addItem:imageView];
    
    if (_itemBehavior.items.count >= 10) {
        [timerObj invalidate];
    }
}
@end

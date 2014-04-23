//
//  ViewController.m
//  ex_UIDA_Gravity_Collision
//
//  Created by tyamamo on 2014/04/23.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *azarashi;
@property (strong, nonatomic) UIDynamicAnimator * animator;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    NSArray* items = @[_azarashi];
    
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    itemBehavior.density = 1.0;
    itemBehavior.elasticity = 0.6;
    itemBehavior.friction = 0.3;
    itemBehavior.resistance = 0.5;
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:items];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:items];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:itemBehavior];
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

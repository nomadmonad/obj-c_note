//
//  ViewController.m
//  ex_UIDA_Gravity_Collision_ItemBehavior
//
//  Created by tyamamo on 2014/04/24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)tappedView:(UITapGestureRecognizer *)sender;

@property (nonatomic, strong) UIDynamicAnimator* animator;
@property (nonatomic, strong) UIDynamicItemBehavior* frogItemBehavior;
@property (nonatomic, strong) UIDynamicItemBehavior* sealItemBehavior;
@property (nonatomic, strong) UIGravityBehavior* gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior* collisionBehavior;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    NSArray* items = nil;
    self.frogItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    self.frogItemBehavior.density = 1.0;
    self.frogItemBehavior.elasticity = 0.6;
    self.frogItemBehavior.friction = 0.3;
    self.frogItemBehavior.resistance = 0.5;
    
    self.sealItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    self.sealItemBehavior.density = 0.5;
    self.sealItemBehavior.elasticity = 1.0;
    self.sealItemBehavior.friction = 0.5;
    self.sealItemBehavior.resistance = 0.2;
    
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:items];
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:items];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:self.frogItemBehavior];
    [self.animator addBehavior:self.sealItemBehavior];
    [self.animator addBehavior:self.gravityBehavior];
    [self.animator addBehavior:self.collisionBehavior];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedView:(UITapGestureRecognizer *)sender {
    NSArray* itemNames = @[@"frog.png", @"azarashi.png"];
    NSInteger index = arc4random() % itemNames.count;
    NSString* imageName = itemNames[index];
    
    UIImage* image = [UIImage imageNamed:imageName];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.center = [sender locationInView:self.view];
    [self.view addSubview:imageView];
    
    if ([imageName isEqualToString:@"frog.png"]) {
        [self.frogItemBehavior addItem:imageView];
    } else {
        [self.sealItemBehavior addItem:imageView];
    }
    
    [self.gravityBehavior addItem:imageView];
    [self.collisionBehavior addItem:imageView];
    
}
@end

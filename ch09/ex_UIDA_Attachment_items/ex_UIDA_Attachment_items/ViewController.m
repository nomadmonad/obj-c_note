//
//  ViewController.m
//  ex_UIDA_Attachment_items
//
//  Created by tyamamo on 2014/04/25.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tShirt;
@property (weak, nonatomic) IBOutlet UIImageView *frog;

@property (nonatomic, strong) UIDynamicAnimator* animator;
@property (nonatomic, strong) UIDynamicItemBehavior* itemBehavior;
@property (nonatomic, strong) UIGravityBehavior* gravityBahivor;
@property (nonatomic, strong) UICollisionBehavior* collisionBehavior;
@property (nonatomic, strong) UIAttachmentBehavior* attachmentBehavior;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    NSArray* items = @[_tShirt];
    _itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:items];
    _itemBehavior.density = 1.0;
    _itemBehavior.elasticity = 0.8;
    _itemBehavior.friction = 0.6;
    _itemBehavior.resistance = 0.5;
    
    _gravityBahivor = [[UIGravityBehavior alloc] initWithItems:items];
    
    _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:items];
    _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    _attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:(id<UIDynamicItem>)_frog
                                                    attachedToItem:(id<UIDynamicItem>)_tShirt];
    _attachmentBehavior.damping = 0.1;
    _attachmentBehavior.length = 1.0;
    _attachmentBehavior.frequency = 6;
    
    [_animator addBehavior:_itemBehavior];
    [_animator addBehavior:_gravityBahivor];
    [_animator addBehavior:_collisionBehavior];
    [_animator addBehavior:_attachmentBehavior];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

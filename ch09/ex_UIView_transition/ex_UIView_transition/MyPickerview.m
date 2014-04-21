//
//  MyPickerview.m
//  ex_UIView_transition
//
//  Created by tyamamo on 2014/04/18.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyPickerview.h"

@implementation MyPickerview

-(CGSize)intrinsicContentSize {
    NSLog(@"%@", @"here");
    CGSize sz = [super intrinsicContentSize];
    sz.height = 140; // but it only goes down to 162
    // sz.width = 250; // just proving this does *something*
    
    return sz;
}
@end

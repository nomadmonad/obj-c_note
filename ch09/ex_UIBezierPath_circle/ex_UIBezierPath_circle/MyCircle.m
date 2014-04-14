//
//  MyCircle.m
//  ex_UIBezierPath_circle
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyCircle.h"

@implementation MyCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGFloat lineW = 8.0;
    [[UIColor redColor] setStroke];
    [[UIColor yellowColor] setFill];
    
    CGFloat width = self.bounds.size.width - lineW;
    CGFloat height = self.bounds.size.height - lineW;
    CGRect theRect = CGRectMake(lineW / 2, lineW / 2, width, height);
    
    UIBezierPath *drawPath = [UIBezierPath bezierPathWithOvalInRect:theRect];
    drawPath.lineWidth = lineW;
    [drawPath fill];
    [drawPath stroke];
}


@end

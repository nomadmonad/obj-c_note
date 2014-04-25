//
//  DrawLine.m
//  ex_UIDA_Gravity_Collision_lineBound
//
//  Created by tyamamo on 2014/04/25.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "DrawLine.h"

@interface DrawLine()
@property CGPoint startPoint;
@property CGPoint endPoint;

@end
@implementation DrawLine

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _startPoint = startPoint;
        _endPoint = endPoint;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:_startPoint];
    [bezierPath addLineToPoint:_endPoint];
    
    [bezierPath stroke];
}


@end

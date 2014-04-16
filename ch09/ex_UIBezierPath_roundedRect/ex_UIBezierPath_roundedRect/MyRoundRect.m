//
//  MyRoundRect.m
//  ex_UIBezierPath_roundedRect
//
//  Created by tyamamo on 2014/04/16.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyRoundRect.h"

@implementation MyRoundRect

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect theRect = self.bounds;
    UIRectCorner corner = (UIRectCornerTopLeft | UIRectCornerBottomRight);
    UIBezierPath *roundRectPath = [UIBezierPath bezierPathWithRoundedRect:theRect
                                                        byRoundingCorners:corner
                                                              cornerRadii:CGSizeMake(40, 40)];
    [[UIColor redColor] setFill];
    [roundRectPath fill];
}


@end

//
//  MyLine.m
//  ex_UIBezierPath_line
//
//  Created by tyamamo on 2014/04/14.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyLine.h"

@implementation MyLine

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    int ptCount = 10;
    int gap = (self.frame.size.width) / ptCount;
    int h = self.frame.size.height;
    
    NSMutableArray *points = [[NSMutableArray alloc] init];
    for (int i = 0; i < ptCount; i++) {
        CGFloat cy = arc4random() % (h - 10) + 5;
        CGPoint pt = CGPointMake(gap * i + 5, cy);
        [points addObject:[NSValue valueWithCGPoint:pt]];
    }
    
    UIBezierPath *drawPath = [UIBezierPath bezierPath];
    [drawPath moveToPoint:[points[0] CGPointValue]];
    for (int i = 1; i < points.count; i++) {
        [drawPath addLineToPoint:[points[i] CGPointValue]];
    }
    [drawPath stroke];
}


@end

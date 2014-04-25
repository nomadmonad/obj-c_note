//
//  DrawBezierPath.m
//  ex_UIDA_Gravity_Collision_bezierPath
//
//  Created by tyamamo on 2014/04/25.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "DrawBezierPath.h"

@interface DrawBezierPath ()
@property UIBezierPath* bezierPath;
@end


@implementation DrawBezierPath

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame bezierPath:(UIBezierPath *)bezierPath
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _bezierPath = bezierPath;
        _bezierPath.lineWidth = 2;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self.bezierPath stroke];
}


@end

//
//  ColorBGButton.m
//  ex_UIButton_ColorBGButton
//
//  Created by tyamamo on 2014/04/07.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "ColorBGButton.h"

@implementation ColorBGButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame label:(NSString *)title bgColor:(UIColor *)rgba
{
    self = [self initWithFrame:frame];
    if (self) {
        self.backgroundColor = rgba;
        [self.layer setCornerRadius:10.0];
        [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [self.layer setBorderWidth:1.0];
        
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        [self setTitleShadowColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.titleLabel.shadowOffset = CGSizeMake(1, 1);
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

//
//  MyPage.m
//  ex_UIScrollView-paging
//
//  Created by tyamamo on 2014/04/10.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import "MyPage.h"

@implementation MyPage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithImageName:(NSString *)imageName frame:(CGRect)frame caption:(NSString *)caption
{
    self = [self initWithFrame:frame];
    
    int labelH = 25;
    CGRect imageFrame = CGRectMake(0, 0, frame.size.width, frame.size.height - labelH);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.text = caption;
    myLabel.frame = CGRectMake(0, frame.size.height - labelH, frame.size.width, labelH);
    myLabel.textAlignment = NSTextAlignmentCenter;
    myLabel.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:imageView];
    [self addSubview:myLabel];
    
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

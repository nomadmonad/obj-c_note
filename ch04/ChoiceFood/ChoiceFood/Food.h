//
//  Food.h
//  ChoiceFood
//
//  Created by tyamamo on 2014/04/04.
//  Copyright (c) 2014年 tyamamo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject
{
    NSArray *foods;
}
@property (readonly) int counter;
- (id)initWithFoods:(NSArray *)entryFoods;
- (NSString *)choiceFoods;
@end

//
//  ViewController.m
//  ChoiceFood
//
//  Created by tyamamo on 2014/04/04.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "Food.h"

@interface ViewController ()
{
    Food *foodObj;
    NSString *theFood;
}

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
- (IBAction)doChoice:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    foodObj = [[Food alloc] initWithFoods:@[@"カレー", @"ラーメン", @"寿司", @"いぶりがっこ"]];
    _answerLabel.text = @"何を食べる？";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doChoice:(id)sender {
    theFood = [foodObj choiceFoods];
    if (foodObj.counter < 3) {
        _answerLabel.text = [NSString stringWithFormat:@"%@でどうでしょう？", theFood];
    } else {
        _answerLabel.text = [NSString stringWithFormat:@"もう%@にしなさい！", theFood];
    }
}
@end

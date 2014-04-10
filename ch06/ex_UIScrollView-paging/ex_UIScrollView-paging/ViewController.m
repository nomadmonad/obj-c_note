//
//  ViewController.m
//  ex_UIScrollView-paging
//
//  Created by tyamamo on 2014/04/10.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *myPageControl;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *pages = [NSMutableArray array];
    
    [pages addObject:@{@"imageName": @"tree.png", @"caption": @"A tree with no name"}];
    [pages addObject:@{@"imageName": @"house.png", @"caption": @"A house with red wall"}];
    [pages addObject:@{@"imageName": @"flower.png", @"caption": @"Cherry Blossoms"}];
    [pages addObject:@{@"imageName": @"car.png", @"caption": @"Blue Pickup"}];
    
    _myPageControl.numberOfPages = pages.count;
    _myPageControl.currentPage = 0;
    _myPageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _myPageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    _myScrollView.delegate = self;
    _myScrollView.scrollEnabled = YES;
    _myScrollView.pagingEnabled = YES;
    _myScrollView.showsHorizontalScrollIndicator = NO;
    _myScrollView.showsVerticalScrollIndicator = NO;
    _myScrollView.backgroundColor = [UIColor colorWithRed:0.95
                                                    green:0.95
                                                     blue:0.7
                                                    alpha:1.0];
    
    CGRect aFrame = _myScrollView.frame;
    _myScrollView.contentSize = CGSizeMake(aFrame.size.width * pages.count, aFrame.size.height);
    
    for (int i = 0; i < pages.count; i++) {
        NSDictionary *pageDic = pages[i];
        NSString *imageName = pageDic[@"imageName"];
        NSString *caption = pageDic[@"caption"];
        
        CGRect pageFrame;
        pageFrame.origin.x = aFrame.size.width * i;
        pageFrame.origin.y = 0;
        pageFrame.size = aFrame.size;
        
        MyPage *aMyPage = [[MyPage alloc] initWithImageName:imageName frame:pageFrame caption:caption];
        [_myScrollView addSubview:aMyPage];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = _myScrollView.frame.size.width;
    int pageNo = floor((_myScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _myPageControl.currentPage = pageNo;
}

@end

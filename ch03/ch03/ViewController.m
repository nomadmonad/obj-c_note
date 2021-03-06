//
//  ViewController.m
//  ch03
//
//  Created by tyamamo on 2014/04/03.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

NSInteger intSort(id num1, id num2, void *context)
{
    int v1 = [num1 intValue];
    int v2 = [num2 intValue];
    
    if (v1 < v2) {
        return NSOrderedAscending;
    } else if (v1 > v2) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)switchOnOff:(UISwitch *)sender {
    if (sender.on == YES) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)ArraySetupButton:(id)sender {
    NSArray *devices = @[@"ipod", @"iPhone", @"iPad"];
    NSLog(@"devices = %@", devices);
    
    NSString *lastDevice = [devices lastObject];
    NSLog(@"配列の最後の要素は、%@", lastDevice);
}

- (IBAction)mutableArraySetup:(id)sender {
    // NSMutableArrayの作成・要素追加
    NSMutableArray *devices = [NSMutableArray array];
    [devices addObject:@"iPod"];
    [devices addObjectsFromArray:@[@"iPhone", @"iPad"]];
    NSLog(@"MutableArray devices = %@", devices);
    
    // インデックスを指定して要素追加
    [devices insertObject:@"Newton" atIndex:0];
    NSLog(@"Is Newton inserted at top? devices = %@", devices);

    // インデックスで要素の削除
    [devices insertObject:@"OS9" atIndex:1];
    [devices insertObject:@"PowerMac" atIndex:2];
    NSLog(@"OS9 and PowerMac Added. devices = %@", devices);
    [devices removeObjectAtIndex:1];
    NSLog(@"OS9 deleted. devices = %@", devices);

    // 値を指定して要素を削除
    [devices removeObject:@"PowerMac"];
    NSLog(@"PowerMac deleted. devices = %@", devices);
    
    // インデックスを指定して要素を取得
    NSUInteger index = [devices indexOfObject:@"Newton"];
    NSLog(@"newton is at index: %d", index);
    index = [devices indexOfObject:@"iPad"];
    NSLog(@"iPad is at index: %d", index);

    // containsObjectを使って要素が存在するか確認
    BOOL isFound = [devices containsObject:@"iPhone"];
    if (isFound) {
        NSLog(@"iPhone is contained!");
    } else {
        NSLog(@"iPhone is not contained...");
    }
    
    // アルファベット順にソートする
    NSArray *sortedDevices = [devices sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSLog(@"sorted devices = %@", sortedDevices);
    
    sortedDevices = [devices sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"" ascending:YES]]];
    NSLog(@"reversed devices = %@", sortedDevices);
    
    // 独自のソート関数を作成する
    NSMutableArray *vlist = [NSMutableArray arrayWithCapacity:10];
    NSInteger v;
    for (int i = 0; i < 10; i++) {
        v = arc4random() % 30;
        [vlist addObject:[NSNumber numberWithInteger:v]];
    }
    NSLog(@"vlist is : %@", vlist);
    
    NSArray *sortedList = [vlist sortedArrayUsingFunction:intSort context:nil];
    NSLog(@"sorted vlist is: %@", sortedList);
    
    // enumeratorから配列を作成する
    NSArray *reverseList = [[devices reverseObjectEnumerator] allObjects];
    NSLog(@"reversed device list is: %@", reverseList);
    
    // tで始まる要素をフィルタリングする
    NSMutableArray *numbers = [NSMutableArray arrayWithArray:@[@"one", @"two", @"three", @"four", @"five"]];
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"%K beginswith %@", @"self", @"t"];
    [numbers filterUsingPredicate:predicate1];
    NSLog(@"filtered with i, list goes: %@", numbers);
    [numbers removeAllObjects];
    
    [numbers addObjectsFromArray:@[@"one", @"two", @"three", @"four", @"five"]];
    NSPredicate *predicateWithE = [NSPredicate predicateWithFormat:@"%K contains %@", @"self", @"e"];
    [numbers filterUsingPredicate:predicateWithE];
    NSLog(@"filtered with e, list goes: %@", numbers);
    [numbers removeAllObjects];
    
    [numbers addObjectsFromArray:@[@"one", @"two", @"three", @"four", @"five"]];
    NSPredicate *predicateWithLength = [NSPredicate predicateWithFormat:@"length == 3"];
    [numbers filterUsingPredicate:predicateWithLength];
    NSLog(@"filtered with length, list goes: %@", numbers);
    [numbers removeAllObjects];
    
    [numbers addObjectsFromArray:@[@3, @18, @20, @7, @9, @10]];
    NSPredicate *predicateWithNumber = [NSPredicate predicateWithFormat:@"%K >= %d", @"self", 10];
    [numbers filterUsingPredicate:predicateWithNumber];
    NSLog(@"filtered with greater then 10, list goes: %@", numbers);

}

- (IBAction)nsDictionaySetup:(id)sender {
    // ディクショナリの生成・値の取得
    NSDictionary *course = @{@"A": @"水泳", @"B": @"バイク", @"C": @"ヨガ"};
    NSLog(@"Aコース %@", course[@"A"]);
    NSLog(@"Bコース %@", course[@"B"]);

    NSDictionary *prizeForMoney = @{@"GOLD": @25000,
                                    @"SILVER": @12000,
                                    @"BRONSE": @5000};
    NSLog(@"金賞は %d円", [prizeForMoney[@"GOLD"] intValue]);
    
}

- (IBAction)nsMutableDictionarySetup:(id)sender {
    // NSMutableDictionaryの生成・値の取得
    NSMutableDictionary *prize = [NSMutableDictionary dictionaryWithCapacity:3];
    
    prize[@"GOLD"] = @"箱根旅行";
    [prize setValue:@"iPod" forKey:@"SILVER"];
    [prize setValue:@"お食事券" forKey:@"BRONZE"];
    NSLog(@"金賞の景品 %@", prize[@"GOLD"]);
    NSLog(@"銀賞の景品 %@", prize[@"SILVER"]);
    NSLog(@"銅賞の景品 %@", prize[@"BRONZE"]);
    
    prize[@"GOLD"] = @"ハワイ旅行";
    NSLog(@"金賞の景品 %@", prize[@"GOLD"]);
    NSLog(@"銀賞の景品 %@", prize[@"SILVER"]);
    NSLog(@"銅賞の景品 %@", prize[@"BRONZE"]);

    NSLog(@"削除前の個数: %d", prize.count);
    [prize removeObjectForKey:@"GOLD"];
    NSLog(@"削除後の個数: %d", prize.count);
    [prize removeAllObjects];
    NSLog(@"全削除後の個数: %d", prize.count);
    
}

- (IBAction)nsSetSetup:(id)sender {
    NSArray *color1 = @[@"blue", @"red", @"yellow", @"white"];
    NSArray *color2 = @[@"green", @"white", @"black"];
    
    // NSSet
    NSSet *colorSet1 = [NSSet setWithArray:color1];
    NSSet *colorSet2 = [NSSet setWithArray:color2];
    NSLog(@"colorset1に含まれる色: %@", colorSet1);
    NSLog(@"colorset2に含まれる色: %@", colorSet2);
    
    // NSMutableSetで和集合
    NSMutableSet *allColors = [NSMutableSet setWithCapacity:1];
    [allColors unionSet:colorSet1];
    [allColors unionSet:colorSet2];
    NSLog(@"すべての色: %@", allColors);
    
    //積集合
    [allColors removeAllObjects];
    [allColors unionSet:colorSet1];
    [allColors intersectSet:colorSet2];
    NSLog(@"共通する色: %@", allColors);
    
    //差集合
    [allColors removeAllObjects];
    [allColors unionSet:colorSet1];
    [allColors minusSet:colorSet2];
    NSLog(@"Colorset2に存在しない色: %@", allColors);
    
    NSSet *set1 = [NSSet setWithArray:@[@"blue", @"red", @"white", @"yellow"]];
    NSSet *set2 = [NSSet setWithArray:@[@"white", @"blue"]];
    NSSet *set3 = [NSSet setWithArray:@[@"pink"]];
    NSLog(@"set1にset2が含まれるか？ %@", ([set2 isSubsetOfSet:set1]==YES ? @"YES":@"NO"));
    NSLog(@"set1にset3が含まれるか？ %@", ([set3 isSubsetOfSet:set1]==YES ? @"YES":@"NO"));
    
    NSSet *sourceSet = [NSSet setWithArray:@[@"One", @"Two", @"Three", @"Four", @"Five"]];
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"%K beginswith %@", @"self", @"T"];
    NSSet *filteredSet = [sourceSet filteredSetUsingPredicate:predicate1];
    NSLog(@"%@", filteredSet);
    
    NSArray *nums = @[@"One", @"Two", @"Three", @"Four", @"Five"];
    NSMutableSet *numSet = [NSMutableSet setWithArray:nums];
    [numSet addObject:@"Six"];
    NSLog(@"numset = %@", numSet);
    
    NSMutableOrderedSet *orderedSet = [NSMutableOrderedSet orderedSetWithArray:nums];
    [orderedSet addObject:@"Six"];
    NSLog(@"orderedSet = %@", orderedSet);
    
    NSLog(@"インデックスの1番目は: %@", orderedSet[1]);
    
    NSComparisonResult (^comparator)(id, id)=^(id obj1, id obj2)
    {
        int v1 = [obj1 intValue];
        int v2 = [obj2 intValue];
        
        if (v1 < v2) {
            return (NSComparisonResult)NSOrderedAscending;
        } else if (v1 > v2) {
            return (NSComparisonResult)NSOrderedDescending;
        } else {
            return (NSComparisonResult)NSOrderedSame;
        }
    };
    
    
    NSArray *values = @[@2, @8, @24, @3, @5];
    NSMutableOrderedSet *valuesOrderedSet = [NSMutableOrderedSet orderedSetWithArray:values];
    [valuesOrderedSet addObject:@11];
    
    NSArray *sortedArray = [valuesOrderedSet sortedArrayUsingComparator:comparator];
    NSLog(@"%@", sortedArray);
}

@end


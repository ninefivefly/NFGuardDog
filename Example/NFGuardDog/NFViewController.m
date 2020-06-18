//
//  NFViewController.m
//  NFGuardDog
//
//  Created by JIANG PENGH CHENG on 06/18/2020.
//  Copyright (c) 2020 JIANG PENGH CHENG. All rights reserved.
//

#import "NFViewController.h"

@interface NFViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic)NSArray<NSArray *>* mTableDatas;

@end

@implementation NFViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mTableDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.mTableDatas[indexPath.row].firstObject;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString* vcClsStr = self.mTableDatas[indexPath.row].lastObject;
    UIViewController* vc = [[NSClassFromString(vcClsStr) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray *)mTableDatas{
    if (!_mTableDatas) {
        _mTableDatas = @[
            @[@"Unrecognise Selector", @"NFUnrecogniseSelViewController"],
            @[@"KVO Crash.", @"NFKVOCrashViewController"],
            @[@"KVC Crash.", @"NFKVCCrashViewController"],
            @[@"NSArray Crash.", @"NFNSArrayCrashViewController"],
            @[@"NSDictionary Crash.", @"NFNSDictionaryCrashViewController"],
            @[@"NSString Crash.", @"NFNStringCrashViewController"],
            @[@"NSAttributedString Crash.", @"NFNSAttributedStringCrashViewController"],
            @[@"NSTimer Crash.", @"NFNSTimerCrashViewController"]
        ];
    }
    return _mTableDatas;
}

@end

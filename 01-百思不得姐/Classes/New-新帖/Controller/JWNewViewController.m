//
//  JWNewViewController.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/22.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWNewViewController.h"

@implementation JWNewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    // 设置背景色
    self.view.backgroundColor = JWGlobalBg;
}

- (void)tagClick
{
    JWLogFunc;
}
@end

//
//  JWFriendTrendsViewController.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/22.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWFriendTrendsViewController.h"
#import "JWRecommendViewController.h"
#import "JWLoginRegisterViewController.h"

@interface JWFriendTrendsViewController()

@end

@implementation JWFriendTrendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    // 设置背景色
    self.view.backgroundColor = JWGlobalBg;
}

- (void)friendsClick
{
    JWRecommendViewController *vc = [[JWRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)loginRegister {
    JWLoginRegisterViewController *login = [[JWLoginRegisterViewController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
}
@end

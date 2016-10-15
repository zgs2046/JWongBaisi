//
//  JWTabBarController.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/22.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWTabBarController.h"
#import "JWEssenceViewController.h"
#import "JWNewViewController.h"
#import "JWFriendTrendsViewController.h"
#import "JWMeViewController.h"
#import "JWTabBar.h"
#import "JWNavigationController.h"

@interface JWTabBarController()

@end

@implementation JWTabBarController

// 在这个只执行一次的方法中设置TabBarItem的属性
+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addAllChildVC];
    
    // 更换tabBar
    [self setValue:[[JWTabBar alloc] init] forKeyPath:@"tabBar"];
}

-(void)addAllChildVC
{
    // 添加子控制器（因为所有的子控制器是应该tabBarControler才应该知道的事，所以，应该把所有的子控制器封装到tabBarControler中，而在Appdelegate中，只需要添加自定义的tabBarControler为根控制器就可以了，而不是把所有的子控制的创建方法那里面）
    [self setupChildVc:[[JWEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVc:[[JWNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[JWFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildVc:[[JWMeViewController alloc] initWithStyle:UITableViewStyleGrouped] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

/**
 * 初始化单个子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    JWNavigationController *nav = [[JWNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end

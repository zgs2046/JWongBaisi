//
//  UIBarButtonItem+JWExtension.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/22.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "UIBarButtonItem+JWExtension.h"

@implementation UIBarButtonItem (JWExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}
@end

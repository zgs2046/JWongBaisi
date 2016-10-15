//
//  UIBarButtonItem+JWExtension.h
//  01-百思不得姐
//
//  Created by JWong on 15/7/22.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JWExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end

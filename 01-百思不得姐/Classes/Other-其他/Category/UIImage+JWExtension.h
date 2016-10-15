//
//  UIImage+JWExtension.h
//  01-百思不得姐
//
//  Created by JWong on 15/8/3.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JWExtension)
/**
 * 圆形图片
 */
- (UIImage *)circleImage;

+ (UIImage *)imageWithName:(NSString *)name;
@end

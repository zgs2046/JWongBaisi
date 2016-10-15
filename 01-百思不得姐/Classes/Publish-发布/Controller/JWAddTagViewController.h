//
//  JWAddTagViewController.h
//  01-百思不得姐
//
//  Created by JWong on 15/8/5.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWAddTagViewController : UIViewController
/** 获取tags的block */
@property (nonatomic, copy) void (^tagsBlock)(NSArray *tags);

/** 所有的标签 */
@property (nonatomic, strong) NSArray *tags;
@end

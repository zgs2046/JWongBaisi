//
//  JWTagTextField.h
//  01-百思不得姐
//
//  Created by JWong on 15/8/5.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWTagTextField : UITextField
/** 按了删除键后的回调 */
@property (nonatomic, copy) void (^deleteBlock)();
@end

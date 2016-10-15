//
//  JWTagTextField.m
//  01-百思不得姐
//
//  Created by JWong on 15/8/5.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWTagTextField.h"

@implementation JWTagTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.placeholder = @"多个标签用逗号或者换行隔开";
        // 设置了占位文字内容以后, 才能设置占位文字的颜色
        [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
        self.height = JWTagH;
    }
    return self;
}

// 也能在这个方法中监听键盘的输入，比如输入“换行”
//- (void)insertText:(NSString *)text
//{
//    [super insertText:text];
//    
//    JWLog(@"%d", [text isEqualToString:@"\n"]);
//}

- (void)deleteBackward
{
    !self.deleteBlock ? : self.deleteBlock();
    
    [super deleteBackward];
}

@end

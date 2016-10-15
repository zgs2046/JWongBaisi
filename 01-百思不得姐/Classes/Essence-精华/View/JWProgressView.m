//
//  JWProgressView.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/29.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWProgressView.h"

@implementation JWProgressView

- (void)awakeFromNib
{
    self.roundedCorners = 2;
    self.progressLabel.textColor = [UIColor whiteColor];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [super setProgress:progress animated:animated];
    
    NSString *text = [NSString stringWithFormat:@"%.0f%%", progress * 100];
    self.progressLabel.text = [text stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

@end

//
//  JWTagButton.m
//  01-百思不得姐
//
//  Created by JWong on 15/8/5.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWTagButton.h"

@implementation JWTagButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"chose_tag_close_icon"] forState:UIControlStateNormal];
        self.backgroundColor = JWTagBg;
        self.titleLabel.font = JWTagFont;
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
    
    self.width += 3 * JWTagMargin;
    self.height = JWTagH;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = JWTagMargin;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + JWTagMargin;
}

@end

//
//  JWMeCell.m
//  01-百思不得姐
//
//  Created by JWong on 15/8/3.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWMeCell.h"

@implementation JWMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *bgView = [[UIImageView alloc] init];
        bgView.image = [UIImage imageNamed:@"mainCellBackground"];
        self.backgroundView = bgView;
        
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.textLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.image == nil) return;
    
    self.imageView.width = 30;
    self.imageView.height = self.imageView.width;
    self.imageView.centerY = self.contentView.height * 0.5;
    
    self.textLabel.x = CGRectGetMaxX(self.imageView.frame) + JWTopicCellMargin;
}
//- (void)setFrame:(CGRect)frame
//{
////    JWLog(@"%@", NSStringFromCGRect(frame));
//    frame.origin.y -= (35 - JWTopicCellMargin);
//    [super setFrame:frame];
//}

@end

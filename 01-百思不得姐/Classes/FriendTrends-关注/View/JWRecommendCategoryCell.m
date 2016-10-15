//
//  JWRecommendCategoryCell.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/23.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWRecommendCategoryCell.h"
#import "JWRecommendCategory.h"

@interface JWRecommendCategoryCell()
/** 选中时显示的指示器控件 */
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;
@end

@implementation JWRecommendCategoryCell

- (void)awakeFromNib {
    self.backgroundColor = JWRGBColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = JWRGBColor(219, 21, 26);
    
    // 当cell的selection为None时, 即使cell被选中了, 内部的子控件也不会进入高亮状态
//    self.textLabel.highlightedTextColor = JWRGBColor(219, 21, 26);
}

- (void)setCategory:(JWRecommendCategory *)category
{
    _category = category;
    
    self.textLabel.text = category.name;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 重新调整内部textLabel的frame
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
}

/**
 * 可以在这个方法中监听cell的选中和取消选中
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : JWRGBColor(78, 78, 78);
}
@end

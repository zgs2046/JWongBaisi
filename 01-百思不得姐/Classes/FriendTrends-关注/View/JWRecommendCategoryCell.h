//
//  JWRecommendCategoryCell.h
//  01-百思不得姐
//
//  Created by JWong on 15/7/23.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWRecommendCategory;

@interface JWRecommendCategoryCell : UITableViewCell
/** 类别模型 */
@property (nonatomic, strong) JWRecommendCategory *category;
@end

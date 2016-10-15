//
//  JWRecommendUserCell.h
//  01-百思不得姐
//
//  Created by JWong on 15/7/23.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWRecommendUser;

@interface JWRecommendUserCell : UITableViewCell
/** 用户模型 */
@property (nonatomic, strong) JWRecommendUser *user;
@end

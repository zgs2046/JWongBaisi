//
//  JWCommentHeaderView.h
//  01-百思不得姐
//
//  Created by JWong on 15/8/2.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWCommentHeaderView : UITableViewHeaderFooterView
/** 文字数据 */
@property (nonatomic, copy) NSString *title;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@end

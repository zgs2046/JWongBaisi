//
//  JWTopicViewController.h
//  01-百思不得姐
//
//  Created by JWong on 15/7/27.
//  Copyright (c) 2015年 JWong. All rights reserved.
//  最基本的帖子控制器

#import <UIKit/UIKit.h>

@interface JWTopicViewController : UITableViewController
/** 帖子类型(交给子类去实现) */
@property (nonatomic, assign) JWTopicType type;
@end

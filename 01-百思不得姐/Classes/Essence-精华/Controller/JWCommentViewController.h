//
//  JWCommentViewController.h
//  01-百思不得姐
//
//  Created by JWong on 15/8/2.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWTopic;

@interface JWCommentViewController : UIViewController
/** 帖子模型 */
@property (nonatomic, strong) JWTopic *topic;
@end

//
//  JWTopicVoiceView.h
//  01-百思不得姐
//
//  Created by JWong on 15/7/30.
//  Copyright (c) 2015年 JWong. All rights reserved.
//  声音帖子中间的内容

#import <UIKit/UIKit.h>
@class JWTopic;


@interface JWTopicVoiceView : UIView
/** 帖子数据 */
@property (nonatomic, strong) JWTopic *topic;
@end

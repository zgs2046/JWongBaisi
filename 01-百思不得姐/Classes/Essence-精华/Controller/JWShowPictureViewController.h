//
//  JWShowPictureViewController.h
//  01-百思不得姐
//
//  Created by JWong on 15/7/29.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWTopic;

@interface JWShowPictureViewController : UIViewController
/** 帖子 */
@property (nonatomic, strong) JWTopic *topic;
@end

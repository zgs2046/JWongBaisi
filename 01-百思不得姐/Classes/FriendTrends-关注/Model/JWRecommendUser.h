//
//  JWRecommendUser.h
//  01-百思不得姐
//
//  Created by JWong on 15/7/23.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWRecommendUser : NSObject
/** 头像 */
@property (nonatomic, copy) NSString *header;
/** 粉丝数(有多少人关注这个用户) */
@property (nonatomic, assign) NSInteger fans_count;
/** 昵称 */
@property (nonatomic, copy) NSString *screen_name;
@end

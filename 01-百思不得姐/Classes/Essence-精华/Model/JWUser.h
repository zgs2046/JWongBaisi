//
//  JWUser.h
//  01-百思不得姐
//
//  Created by JWong on 15/8/2.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWUser : NSObject
/** 用户名 */
@property (nonatomic, copy) NSString *username;
/** 性别 */
@property (nonatomic, copy) NSString *sex;
/** 头像 */
@property (nonatomic, copy) NSString *profile_image;
@end

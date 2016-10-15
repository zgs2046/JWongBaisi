//
//  JWRecommendCategory.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/23.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWRecommendCategory.h"
#import <MJExtension.h>

@implementation JWRecommendCategory
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID" : @"id"};
}

//+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
//{
//    // propertyName == myName == myHeight
//    if ([propertyName isEqualToString:@"ID"]) return @"id";
//    
//    return propertyName;
//}

- (NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}
@end

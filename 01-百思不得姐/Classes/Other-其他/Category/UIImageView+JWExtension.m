//
//  UIImageView+JWExtension.m
//  01-百思不得姐
//
//  Created by JWong on 15/8/3.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "UIImageView+JWExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (JWExtension)
- (void)setHeader:(NSString *)url
{
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }];
}
@end

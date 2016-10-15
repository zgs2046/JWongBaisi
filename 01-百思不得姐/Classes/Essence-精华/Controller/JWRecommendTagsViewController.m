//
//  JWRecommendTagsViewController.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/23.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWRecommendTagsViewController.h"
#import "JWRecommendTag.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "JWRecommendTagCell.h"

@interface JWRecommendTagsViewController ()
/** 标签数据 */
@property (nonatomic, strong) NSArray *tags;
@end

static NSString * const JWTagsId = @"tag";

@implementation JWRecommendTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self loadTags];
}

- (void)loadTags
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        self.tags = [JWRecommendTag objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"加载标签数据失败!"];
    }];
}

- (void)setupTableView
{
    self.title = @"推荐标签";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JWRecommendTagCell class]) bundle:nil] forCellReuseIdentifier:JWTagsId];
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = JWGlobalBg;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JWRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:JWTagsId];
    
    cell.recommendTag = self.tags[indexPath.row];
    
    return cell;
}

@end

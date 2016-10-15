//
//  JWTopicViewController.m
//  01-百思不得姐
//
//  Created by JWong on 15/7/26.
//  Copyright (c) 2015年 JWong. All rights reserved.
//

#import "JWTopicViewController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "JWTopic.h"
#import <MJExtension.h>
#import <MJRefresh.h>
#import "JWTopicCell.h"
#import "JWCommentViewController.h"
#import "JWNewViewController.h"

@interface JWTopicViewController ()
/** 帖子数据 */
@property (nonatomic, strong) NSMutableArray *topics;
/** 当前页码 */
@property (nonatomic, assign) NSInteger page;
/** 当加载下一页数据时需要这个参数 */
@property (nonatomic, copy) NSString *maxtime;
/** 上一次的请求参数 */
@property (nonatomic, strong) NSDictionary *params;

/** 上次选中的索引(或者控制器) */
@property (nonatomic, assign) NSInteger lastSelectedIndex;
@end

@implementation JWTopicViewController
- (NSMutableArray *)topics
{
    if (!_topics) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化表格
    [self setupTableView];
    
    // 添加刷新控件
    [self setupRefresh];
    
}

static NSString * const JWTopicCellId = @"topic";
- (void)setupTableView
{
    // 设置内边距
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat top = JWTitilesViewY + JWTitilesViewH;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    // 设置滚动条的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JWTopicCell class]) bundle:nil] forCellReuseIdentifier:JWTopicCellId];
    
    // 监听tabbar点击的通知
    [JWNoteCenter addObserver:self selector:@selector(tabBarSelect) name:JWTabBarDidSelectNotification object:nil];
}

- (void)tabBarSelect
{
    // 如果是连续选中2次, 直接刷新
    if (self.lastSelectedIndex == self.tabBarController.selectedIndex
//        && self.tabBarController.selectedViewController == self.navigationController
        && self.view.isShowingOnKeyWindow) {
        [self.tableView.header beginRefreshing];
    }
    
    // 记录这一次选中的索引
    self.lastSelectedIndex = self.tabBarController.selectedIndex;
}

- (void)setupRefresh
{
   
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    // 自动改变透明度
    self.tableView.header.autoChangeAlpha = YES;
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

#pragma mark - a参数
- (NSString *)a
{
    return [self.parentViewController isKindOfClass:[JWNewViewController class]] ? @"newlist" : @"list";
}

#pragma mark - 数据处理
/**
 * 加载新的帖子数据
 */
- (void)loadNewTopics
{
    // 结束上啦
    [self.tableView.footer endRefreshing];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = self.a;
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    self.params = params;
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        
        if (self.params != params) return;
        
        // 存储maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典 -> 模型
        self.topics = [JWTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.header endRefreshing];
        
        // 清空页码
        self.page = 0;
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.header endRefreshing];
    }];
}

// 先下拉刷新, 再上拉刷新第5页数据

// 下拉刷新成功回来: 只有一页数据, page == 0
// 上啦刷新成功回来: 最前面那页 + 第5页数据

/**
 * 加载更多的帖子数据
 */
- (void)loadMoreTopics
{
    // 结束下拉
    [self.tableView.header endRefreshing];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = self.a;
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    NSInteger page = self.page + 1;
    params[@"page"] = @(page);
    params[@"maxtime"] = self.maxtime;
    self.params = params;
    
    // 发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        if (self.params != params) return;
        
        // 存储maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典 -> 模型
        NSArray *newTopics = [JWTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:newTopics];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.footer endRefreshing];
        
        // 设置页码
        self.page = page;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.footer endRefreshing];
        
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.tableView.footer.hidden = (self.topics.count == 0);
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JWTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:JWTopicCellId];
    
    cell.topic = self.topics[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出帖子模型
    JWTopic *topic = self.topics[indexPath.row];
    
    // 返回这个模型对应的cell高度
    return topic.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JWCommentViewController *commentVc = [[JWCommentViewController alloc] init];
    commentVc.topic = self.topics[indexPath.row];
    [self.navigationController pushViewController:commentVc animated:YES];
}

@end
//
//  ICTableViewController.m
//  ICStaticPageExample
//
// github地址:https://github.com/corderguo/StaticPage
//
//  Created by Mr.Guo on 15/5/28.
//  Copyright © 2016年 XianZhuangGuo. All rights reserved.
//

#import "ICTableViewController.h"
#import "ICTestViewController.h"
#import "ICCommonItemCell.h"

@interface ICTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ICTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Nav

- (void)setNav
{
    self.title = @"静态页面";
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ICCommonGroup * group = self.dataArray[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ICCommonItemCell *cell = [ICCommonItemCell cellWithTableView:tableView];
    ICCommonGroup *group = self.dataArray[indexPath.section];
    ICCommonItem *item = group.items[indexPath.row];
    cell.item = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICCommonGroup *group = self.dataArray[indexPath.section];
    ICCommonItem *item = group.items[indexPath.row];
    if ([item isKindOfClass:[ICSettingArrowItem class]]) {
        ICTestViewController *testVC = [[ICTestViewController alloc] init];
        testVC.titleName = (NSString *)item.parameter;
        [self.navigationController pushViewController:testVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 8.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8.0;
}


#pragma mark - Getter

- (UITableView *)tableView
{
    if (nil == _tableView) {
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        
        _tableView.delegate   = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSMutableArray *)dataArray
{
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray array];
        
        ICCommonItem *friendItem  = [ICSettingArrowItem itemWithIcon:@"ff_IconShowAlbum" title:@"朋友圈" destVcClass:[ICTestViewController class] parameter:@"朋友圈"]; // 根据要跳转的控制器需要的参数类型，具体填写，我这里需要的是字符串类型，就传递的字符串
        ICCommonGroup *friendGroup = [[ICCommonGroup alloc] init];
        friendGroup.items          = @[friendItem];
        
        ICCommonItem *sweepItem    = [ICSettingArrowItem itemWithIcon:@"ff_IconQRCode" title:@"扫一扫" destVcClass:[ICTestViewController class] parameter:@"扫一扫"];
        ICCommonItem *waveItem     = [ICSettingArrowItem itemWithIcon:@"ff_IconShake" title:@"摇一摇" destVcClass:[ICTestViewController class] parameter:@"摇一摇"];
        ICCommonGroup *sewaGroup   = [[ICCommonGroup alloc] init];
        sewaGroup.items            = @[sweepItem,waveItem];
        
        ICCommonItem *nearItem     = [ICSettingArrowItem itemWithIcon:@"ff_IconLocationService" title:@"附近的人" destVcClass:[ICTestViewController class] parameter:@"附近的人"];
        ICCommonItem *driftItem    = [ICSettingArrowItem itemWithIcon:@"ff_IconBottle" title:@"漂流瓶" destVcClass:[ICTestViewController class] parameter:@"漂流瓶"];
        ICCommonGroup *nedrGroup   = [[ICCommonGroup alloc] init];
        nedrGroup.items            = @[nearItem,driftItem];
        
        ICCommonItem *shopItem     = [ICSettingArrowItem itemWithIcon:@"ff_IconQRCode" title:@"购物" destVcClass:[ICTestViewController class] parameter:@"购物"];
        ICCommonItem *gameItem     = [ICSettingArrowItem itemWithIcon:@"MoreGame" title:@"游戏" destVcClass:[ICTestViewController class] parameter:@"游戏"];
        ICCommonGroup *shgaGroup   = [[ICCommonGroup alloc] init];
        shgaGroup.items            = @[shopItem,gameItem];
        
        [_dataArray addObject:friendGroup];
        [_dataArray addObject:sewaGroup];
        [_dataArray addObject:nedrGroup];
        [_dataArray addObject:shgaGroup];
    }
    return _dataArray;
}


@end

//
//  ICTestViewController.m
//  ICStaticPage
//
// github地址:https://github.com/corderguo/StaticPage
//
//  Created by Mr.Guo on 15/5/28.
//  Copyright © 2016年 XianZhuangGuo. All rights reserved.
//

#import "ICTestViewController.h"
#import "ICCommonItemCell.h"

@interface ICTestViewController ()<UITableViewDataSource,UITableViewDelegate,ICCommonItemCellDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ICTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.titleName;
    
    [self.view addSubview:self.tableView];
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
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICCommonGroup *group = self.dataArray[indexPath.section];
    ICCommonItem *item = group.items[indexPath.row];
    if (item.option) {
        item.option();
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ICCommonGroup *group = self.dataArray[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ICCommonGroup *group = self.dataArray[section];
    return group.footer;
}

#pragma mark - ICCommonItemCellDelegate

- (void)commonItemCell:(ICCommonItemCell *)cell swith:(UISwitch *)swith
{
    NSLog(@"swithClicked");
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
        
        ICCommonItem *headimgItem  = [ICSettingArrowItem itemWithIcon:nil title:@"会话头像" destVcClass:nil parameter:nil];
        headimgItem.option            = ^ {
            NSLog(@"会话头像");
        };
        ICCommonItem *nameItem     = [ICSettingArrowItem itemWithIcon:nil title:@"会话名称" destVcClass:nil parameter:nil];
        nameItem.option            = ^ {
            NSLog(@"会话名称");
        };
        ICCommonGroup *attriGroup  = [[ICCommonGroup alloc] init];
        attriGroup.items           = @[headimgItem,nameItem];
        
        ICCommonItem * discover    = [ICSettingSwitchItem itemWithIcon:nil title:@"置顶会话" destVcClass:nil parameter:nil];
        ICCommonItem *companyDoc   = [ICSettingSwitchItem itemWithIcon:nil title:@"消息免打扰" destVcClass:nil parameter:nil];
        ICCommonGroup * mesGroup   = [[ICCommonGroup alloc] init];
        mesGroup.header            = @"来个区头玩玩";
        mesGroup.items = @[discover,companyDoc];
        
        ICCommonItem *companyNews  = [ICSettingArrowItem itemWithIcon:nil title:@"查找会话记录" destVcClass:nil parameter:nil];
        companyNews.option            = ^ {
            NSLog(@"查找会话记录");
        };
        ICCommonItem *noneItem     = [ICSettingNoneItem itemWithIcon:nil title:@"清空会话记录" destVcClass:nil parameter:nil];
        noneItem.option            = ^ {
            NSLog(@"清空会话记录");
        };
        ICCommonGroup * comGroup   = [[ICCommonGroup alloc] init];
        comGroup.footer            = @"来个区尾玩玩";
        comGroup.items             = @[companyNews,noneItem];
        
        [_dataArray addObject:attriGroup];
        [_dataArray addObject:mesGroup];
        [_dataArray addObject:comGroup];
        
    }
    return _dataArray;
}

@end

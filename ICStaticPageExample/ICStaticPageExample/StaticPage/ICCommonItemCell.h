//
//  ICCommonItemCell.h
//  ICStaticPage
//
// github地址:https://github.com/corderguo/StaticPage
//
//  Created by Mr.Guo on 15/5/28.
//  Copyright © 2016年 XianZhuangGuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSettingArrowItem.h"
#import "ICSettingSwitchItem.h"
#import "ICSettingNoneItem.h"
#import "ICCommonItem.h"
#import "ICCommonGroup.h"

@class ICCommonItemCell;
@protocol ICCommonItemCellDelegate <NSObject>

- (void)commonItemCell:(ICCommonItemCell *)cell
                 swith:(UISwitch *)swith;

@end

@interface ICCommonItemCell : UITableViewCell

@property (nonatomic ,strong) ICCommonItem *item;

@property (nonatomic, weak) id<ICCommonItemCellDelegate>delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end

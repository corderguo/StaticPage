//
//  ICCommonItem.m
//  ICStaticPage
//
// github地址:https://github.com/corderguo/StaticPage
//
//  Created by Mr.Guo on 15/5/28.
//  Copyright © 2016年 XianZhuangGuo. All rights reserved.
//

#import "ICCommonItem.h"

@implementation ICCommonItem


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass parameter:(id)parameter
{
    ICCommonItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.destVcClass = destVcClass;
    item.parameter = parameter;
    return item;
}

@end

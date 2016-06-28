//
//  ICCommonItem.h
//  ICStaticPage
//
// github地址:https://github.com/corderguo/StaticPage
//
//  Created by Mr.Guo on 15/5/28.
//  Copyright © 2016年 XianZhuangGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GXItemOption)();

@interface ICCommonItem : NSObject

@property (nonatomic ,strong) NSString *icon;
@property (nonatomic ,strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
// 具体的操作
@property (nonatomic ,copy) GXItemOption option;

// 目的控制器
@property (nonatomic ,assign) Class destVcClass;

// 传递的参数
@property (nonatomic, strong) id parameter;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass parameter:(id)parameter;

@end

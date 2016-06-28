//
//  ICCommonItemCell.m
//  ICStaticPage
//
//  Created by Mr.Guo on 15/5/28.
//  Copyright © 2016年 XianZhuangGuo. All rights reserved.
//

#import "ICCommonItemCell.h"


@interface ICCommonItemCell ()

@property (nonatomic, strong) UIImageView *accessoryImageV;
@property (nonatomic, strong) UISwitch *switchV;

@end

@implementation ICCommonItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID     = @"ICStaticPageCell";
    
    ICCommonItemCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[ICCommonItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setItem:(ICCommonItem *)item
{
    _item = item;
    
    [self setupData];
    
    [self setUpAccessoryView];
}

- (void)setupData
{
    if (_item.icon) {
        self.imageView.image = [UIImage imageNamed:_item.icon];
    }
    self.textLabel.text     = _item.title;
}

- (void)setUpAccessoryView
{
    if ([_item isKindOfClass:[ICSettingArrowItem class]]) { // Arrow
        self.accessoryView = self.accessoryImageV;
    }else if ([_item isKindOfClass:[ICSettingSwitchItem class]]){ // Switch
        self.accessoryView = self.switchV;
    }else{
        self.accessoryView = nil;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - Event

- (void)switchChanged:(UISwitch *)swic
{
    if ([self.delegate respondsToSelector:@selector(commonItemCell:swith:)]) {
        [self.delegate commonItemCell:self swith:swic];
    }
}

#pragma mark - Getter

- (UISwitch *)switchV
{
    if (nil == _switchV) {
        
        _switchV = [[UISwitch alloc] init];
        [_switchV addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchV;
}

- (UIImageView *)accessoryImageV
{
    if (nil == _accessoryImageV) {
        _accessoryImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"App_rightArrow"]];
    }
    return _accessoryImageV;
}


@end

# StaticPage
- 静态页面大杀器，利用该库三行代码就能搞定通用静态页面          

更多详情请访问： [骚客](https://corderguo.github.io/2016/06/28/iOS-staticPage/)    	

![](http://oet7ffdgt.bkt.clouddn.com/3.jpg) ![](http://oet7ffdgt.bkt.clouddn.com/4.jpg)     


# 如何使用StaticPage     
首先先把你控制器中tableview的类型设置为UITableViewStyleGrouped类型      

```sh
_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
```

只需要导入ICCommonItemCell.h头文件	

```sh
import "ICCommonItemCell.h"
```

然后在你的数据源中根据分组来设置相应的数据，例如demo中的代码:	
      

```sh
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
```


其中ICCommonGroup对应一组，而ICCommonItem又对应组中的每一个Item，每个Item有两种类型
，分别为ICSettingArrowItem和ICSettingSwitchItem；
       
```sh
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass parameter:(id)parameter;
```

这个方法中的参数含义：		
      
- icon：cell中左边图片的图片名		
- title：cell的title显示的字符串内容		
- destVcClass：点击cell时要跳转的控制器类型			
- parameter：点击cell时要跳转时需要传递过去的参数		       

如果ICCommonItem中存在ICSettingSwitchItem，为了扑捉到UISwitch的开关事件，你需要遵守ICCommonItemCellDelegate，实现其中的代理方法：		

      
```sh
- (void)commonItemCell:(ICCommonItemCell *)cell
                 swith:(UISwitch *)swith;
```

如果想要改变每个组之间的间距（是组不是每个Item）你可以重写tableview的两个代理方法，返回自己想要的间距即可：	
     
```sh
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{}
```

每个Item还可以在其对应的block中响应对应的事件，这样只需在tableview的didSelected方法中调用option这个block即可；         

如果你需要显示区头或者区尾，只需要在数据源中给对用的group设置header或footer即可： 	
     
```sh
 ICCommonItem * discover    = [ICSettingSwitchItem itemWithIcon:nil title:@"置顶会话" destVcClass:nil parameter:nil];
 ICCommonItem *companyDoc   = [ICSettingSwitchItem itemWithIcon:nil title:@"消息免打扰" destVcClass:nil parameter:nil];
ICCommonGroup * mesGroup   = [[ICCommonGroup alloc] init];
mesGroup.header            = @"来个区头玩玩";
mesGroup.items = @[discover,companyDoc];
```

然后在tableview的代理方法中调用即可：       

```sh
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
```

如果你在使用过程中遇到什么问题您可以issues提问，如果你想贡献代码请pull Reques；



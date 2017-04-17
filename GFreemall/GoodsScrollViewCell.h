//
//  GoodsScrollViewCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GoodsScrollViewDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)GoodsScroll:(NSInteger)index;


@end
@interface GoodsScrollViewCell : UITableViewCell<SDCycleScrollViewDelegate>
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)SDCycleScrollView* scroll;
@property(nonatomic,strong)NSDictionary *dic;
@end

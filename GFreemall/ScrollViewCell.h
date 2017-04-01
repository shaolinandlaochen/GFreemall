//
//  ScrollViewCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HomeScrollViewDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)HomeScroll:(NSInteger)index;
@end
@interface ScrollViewCell : UITableViewCell<SDCycleScrollViewDelegate>
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)NSDictionary *Dic;
@property(nonatomic,strong)NSArray *Array;
@end

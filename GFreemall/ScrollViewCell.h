//
//  ScrollViewCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewCell : UITableViewCell<SDCycleScrollViewDelegate>
@property(nonatomic,strong)NSDictionary *Dic;
@property(nonatomic,strong)NSArray *Array;
@property(nonatomic,strong)MyButton *MyBtn;
@end

//
//  ImageCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ImageButtonDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)ImageButton:(NSInteger)index;
@end
@interface ImageCell : UITableViewCell
@property(nonatomic,strong)NSDictionary *model;
@property(nonatomic,assign)id delegate;
@end

//
//  MyNewsCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNewsCell : UITableViewCell
@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *context;
@property(nonatomic,copy)NSString *unreadStr;
@property(nonatomic,strong)UILabel *unread;
@end

//
//  basicInformationCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface basicInformationCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *string;
@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,copy)NSString *imgName;
@end

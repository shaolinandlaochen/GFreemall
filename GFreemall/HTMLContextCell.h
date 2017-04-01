//
//  HTMLContextCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HTMLContextDelegate<NSObject>
-(void)htmlHeight:(float)height;
@end
@interface HTMLContextCell : UITableViewCell
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)NSDictionary *dataDic;
@property(nonatomic,strong)UIImageView *imgbj;
@property(nonatomic,assign)float width;
@end

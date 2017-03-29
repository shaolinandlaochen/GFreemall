//
//  MoreAndMoreCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

//开代理
@protocol languageDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)LanguageSwitching;
@end

@interface MoreAndMoreCell : UITableViewCell

@end

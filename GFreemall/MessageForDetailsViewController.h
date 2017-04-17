//
//  MessageForDetailsViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageForDetailsViewController : UIViewController
@property(nonatomic,assign)int message_id;
@property(nonatomic,copy)NSString *titleStr;
@property(nonatomic,copy)NSString *context;
@end

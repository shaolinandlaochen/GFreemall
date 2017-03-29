//
//  MyButton.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIButton
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,copy)NSString *string;
@property(nonatomic,strong)NSDictionary *MyDic;
@end

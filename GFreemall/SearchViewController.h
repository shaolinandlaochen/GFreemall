//
//  SearchViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property(nonatomic,copy)NSString *where;
@property(nonatomic,strong)NSDictionary *dataDic;
@property(nonatomic,copy)NSString *categorySerial;
@end

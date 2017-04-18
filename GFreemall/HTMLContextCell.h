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
@interface HTMLContextCell : UITableViewCell<UIWebViewDelegate>
@property(nonatomic,assign)id delegate;
@property(nonatomic,copy)NSString *context;
@property(nonatomic,strong)NSMutableArray *imageUrl;
@end

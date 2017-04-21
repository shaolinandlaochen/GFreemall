//
//  AttributeSelectionViewController.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/2.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ShutDownDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)hutDownGo;
@end
@interface AttributeSelectionViewController : UIViewController
@property(nonatomic,assign)id deleghate;
@property(nonatomic,strong)NSDictionary *dataDic;
@end

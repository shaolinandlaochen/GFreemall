//
//  Recommended.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/10.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RecommendedTheModalDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)RecommendedTheModalDelegateTheModal;
-(void)RecommendedTheModalDelegateButtonsAtTheBottom:(BOOL)smallAndBig;


@end
@interface Recommended : UIViewController
@property(nonatomic,assign)id delegate;
@end

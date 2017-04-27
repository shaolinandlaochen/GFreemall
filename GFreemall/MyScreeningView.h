//
//  MyScreeningView.h
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyScreeningViewDelegate<NSObject>
-(void)index:(NSInteger)idx;
@end
@interface MyScreeningView : UIView
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)ProductEvaluationBaseClass *model;
@end

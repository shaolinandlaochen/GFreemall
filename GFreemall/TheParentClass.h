//
//  TheParentClass.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TheParentClass : UIViewController
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,strong)NSArray *array;

//获取颜色值公用方法
+(UIColor *)colorWithHexString:(NSString *)color;





@end

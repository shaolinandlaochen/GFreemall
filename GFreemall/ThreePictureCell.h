//
//  ThreePictureCell.h
//  GFreemall
//
//  Created by 韩少林 on 2017/3/29.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreePictureCell : UITableViewCell
@property(nonatomic,strong)MyButton *oneBtn;
@property(nonatomic,strong)MyButton *twoBtn;
@property(nonatomic,strong)MyButton *threeBtn;
@property(nonatomic,strong)MyButton *smallOneBtn;
@property(nonatomic,strong)MyButton *smallTwoBtn;
@property(nonatomic,strong)MyButton *fourBtn;
@property(nonatomic,strong)MyButton *fiveBtn;
@property(nonatomic,strong)MyButton *sixBtn;
@property(nonatomic,strong)MyButton *sevenBtn;
@property(nonatomic,strong)NSDictionary *model;



@property(nonatomic,strong)UILabel *nameOne;
@property(nonatomic,strong)UILabel *nameTwo;
@property(nonatomic,strong)UILabel *nameFour;
@property(nonatomic,strong)UILabel *namefive;
@property(nonatomic,strong)UILabel *nameSix;
@property(nonatomic,strong)UILabel *nameSeven;

@property(nonatomic,strong)UILabel *picOne;
@property(nonatomic,strong)UILabel *picTwo;
@property(nonatomic,strong)UILabel *picFour;
@property(nonatomic,strong)UILabel *picSeven;
@property(nonatomic,strong)UILabel *picfive;
@property(nonatomic,strong)UILabel *picSix;

@end

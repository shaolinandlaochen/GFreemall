//
//  GFMViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GFMViewController.h"
#import "GFMS.h"
#import "Recommended.h"
#import "LineUp.h"
#import "babbarButton.h"
@interface GFMViewController ()<TheModalDelegate,LineTheModalDelegate,RecommendedTheModalDelegate>
{
    UIView *colorsView;
    CAGradientLayer *gradientLayer;
    UIView *ThreeButtonsAtTheBottom;
    NSArray *navArray;
    UIButton *forwardingBtn;
    UILabel *title;
}
@end

@implementation GFMViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    GFMS *gfm=[[GFMS alloc]init];
    gfm.delegate=self;
    UINavigationController *navGFM=[[UINavigationController alloc]initWithRootViewController:gfm];
    LineUp *line=[[LineUp alloc]init];
    line.delegate=self;
    UINavigationController *navLine=[[UINavigationController alloc]initWithRootViewController:line];
    
    Recommended *recom=[[Recommended alloc]init];
    recom.delegate=self;
    UINavigationController *navReome=[[UINavigationController alloc]initWithRootViewController:recom];
    navArray=@[navGFM,navLine,navReome];
    
    [self CreatThreeButtonsAtTheBottom];
    
    // Do any additional setup after loading the view.
}

-(void)onCanceClick{
[self dismissViewControllerAnimated:YES completion:^{
    
}];
}
//转发
-(void)onforwardingBtnClick{

}
-(void)CreatThreeButtonsAtTheBottom{
autoSize
    
    ThreeButtonsAtTheBottom=[[UIView alloc]init];
    ThreeButtonsAtTheBottom.backgroundColor=[UIColor whiteColor];
    float y=self.view.frame.size.height-(98*autoSizeScaleY);
    ThreeButtonsAtTheBottom.frame=CGRectMake(0, y, self.view.frame.size.width, 98*autoSizeScaleY);
    [self.view addSubview:ThreeButtonsAtTheBottom];
    
   
    NSArray *_imgsArray=@[@"home1234",@"icon_paidui",@"icon_tuijian"];
    NSArray *_selsctedBtnImages=@[@"home5678",@"icon_paidui_s",@"icon_tuijian_s"];
    NSArray *nameArray=@[@"GFM",@"排队",@"推荐"];
    
    for (int i=0; i<3; i++) {
        float x=self.view.frame.size.width/3;
        //图标
        babbarButton *btn=[babbarButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:_imgsArray[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:_selsctedBtnImages[i]] forState:UIControlStateSelected];
        [btn setTitle:Localized(nameArray[i]) forState:UIControlStateNormal];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"#998585"] forState:UIControlStateNormal];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"#e61f5b"] forState:UIControlStateSelected];
        btn.titleLabel.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        if (i==_index) {
            btn.selected=YES;
        }else{
            btn.selected=NO;
        }
        btn.tag=i+1;
        btn.titleLabel.textAlignment=NSTextAlignmentCenter;
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [ThreeButtonsAtTheBottom addSubview:btn];
        btn.sd_layout.topSpaceToView(ThreeButtonsAtTheBottom, 1).leftSpaceToView(ThreeButtonsAtTheBottom, x*i).widthIs(x).heightIs(96*autoSizeScaleY);
        
    }
    
    
    self.index=0;
}
-(void)onButtonClick:(babbarButton *)btn{
    if (btn.tag==_index+1) {
        return;
    }else{
        self.index=btn.tag-1;
        for (int i=0; i<3; i++) {
            babbarButton *button=(babbarButton *)[ThreeButtonsAtTheBottom viewWithTag:i+1];
            if (i+1==btn.tag) {
                button.selected=YES;
            }else{
                button.selected=NO;
            }
        }
        
    }
    if (btn.tag==1) {
        title.text=@"GFM";
    }else if (btn.tag==2){
        title.text=Localized(@"编号排队");
    }else if (btn.tag==3){
        title.text=Localized(@"我的推荐");
    }
}
-(void)setIndex:(NSInteger)index{
    
    if (_index==index) {
        // return;
    }
    if (_index>=0) {
        UIViewController *contrlooer=[navArray objectAtIndex:_index];
        [contrlooer.view removeFromSuperview];
    }
    UIViewController *viewcontroller=[navArray objectAtIndex:index];
    [self.view addSubview:viewcontroller.view];
    [self.view sendSubviewToBack:viewcontroller.view];
    _index=index;
}
//控制是否出模态
-(void)TheModal{
    [self onCanceClick];
}
-(void)LineTheModal{
[self onCanceClick];
}
-(void)RecommendedTheModalDelegateTheModal{
[self onCanceClick];
}
-(void)RecommendedTheModalDelegateButtonsAtTheBottom:(BOOL)smallAndBig{
 [self SmallAndBigs:smallAndBig];
}
//控制底部坐标大小
-(void)ButtonsAtTheBottom:(BOOL)smallAndBig{
 [self SmallAndBigs:smallAndBig];
}
//控制底部坐标大小
-(void)LineButtonsAtTheBottom:(BOOL)smallAndBig{//控制底部tabbar大小
 [self SmallAndBigs:smallAndBig];
}
-(void)SmallAndBigs:(BOOL)why{
    autoSize
    [UIView animateWithDuration:0.3 animations:^{
        if (why==YES) {
            float y=self.view.frame.size.height-(98*autoSizeScaleY);
            ThreeButtonsAtTheBottom.frame=CGRectMake(0, y, self.view.frame.size.width, 98*autoSizeScaleY);
        }else{
            ThreeButtonsAtTheBottom.frame=CGRectMake(0, 1000, self.view.frame.size.width, 98*autoSizeScaleY);
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

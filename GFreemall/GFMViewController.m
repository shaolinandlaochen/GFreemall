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
@interface GFMViewController ()
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
    UINavigationController *navGFM=[[UINavigationController alloc]initWithRootViewController:gfm];
    LineUp *line=[[LineUp alloc]init];
    UINavigationController *navLine=[[UINavigationController alloc]initWithRootViewController:line];
    
    Recommended *recom=[[Recommended alloc]init];
    UINavigationController *navReome=[[UINavigationController alloc]initWithRootViewController:recom];
    navArray=@[navGFM,navLine,navReome];
    
    
    [self CreateTheTopNavigationBar];
    [self CreatThreeButtonsAtTheBottom];
    
    // Do any additional setup after loading the view.
}
-(void)CreateTheTopNavigationBar{
    autoSize
    
    colorsView=[[UIView alloc]init];
    colorsView.frame=CGRectMake(0, 0, self.view.frame.size.width, 127*autoSizeScaleY);
    [self.view addSubview:colorsView];
    
    gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[TheParentClass colorWithHexString:@"#f19d40"].CGColor, (__bridge id)[TheParentClass colorWithHexString:@"#e61f5b"].CGColor];
    gradientLayer.locations = @[@0.1,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, 127*autoSizeScaleY);
    [colorsView.layer addSublayer:gradientLayer];
    
    
    UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(onCanceClick) forControlEvents:UIControlEventTouchUpInside];
    [colorsView addSubview:cancelBtn];
    cancelBtn.sd_layout.leftSpaceToView(colorsView, 10*autoSizeScaleX).bottomSpaceToView(colorsView, 10*autoSizeScaleY).widthIs(68*autoSizeScaleX).heightIs(68*autoSizeScaleY);
    
    //forwarding
    forwardingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [forwardingBtn setImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    [forwardingBtn addTarget:self action:@selector(onforwardingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [colorsView addSubview:forwardingBtn];
    forwardingBtn.sd_layout.rightSpaceToView(colorsView, 10*autoSizeScaleX).bottomSpaceToView(colorsView, 10*autoSizeScaleY).widthIs(68*autoSizeScaleX).heightIs(68*autoSizeScaleY);
    
    
    title=[[UILabel alloc]init];
    title.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
    title.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    title.textAlignment=NSTextAlignmentCenter;
    [colorsView addSubview:title];
    title.sd_layout.leftSpaceToView(colorsView, 200*autoSizeScaleX).rightSpaceToView(colorsView, 200*autoSizeScaleX).bottomSpaceToView(colorsView, 25*autoSizeScaleY).heightIs(40*autoSizeScaleY);
    
    
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
    [self.view addSubview:ThreeButtonsAtTheBottom];
    ThreeButtonsAtTheBottom.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).heightIs(98*autoSizeScaleY);
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
    NSLog(@"111111");
    
    
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

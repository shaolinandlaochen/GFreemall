//
//  PaymentStatusViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "PaymentStatusViewController.h"

@interface PaymentStatusViewController ()
{
    UIView *_views;
}
@end

@implementation PaymentStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    autoSize
    _views=[[UIView alloc]init];
    _views.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_views];
    _views.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).heightIs(400*autoSizeScaleY);
    
    for (int i=0; i<3; i++) {
        float y=0+(98+2)*(i/1);
        MyButton *btn=[[MyButton alloc]init];
        btn.string=self.typeArray[i];
        btn.backgroundColor=[UIColor whiteColor];
        btn.tag=i+1;
        btn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        [btn setTitle:Localized(self.nameArray[i]) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_views addSubview:btn];
        btn.sd_layout.leftSpaceToView(_views, 0).rightSpaceToView(_views, 0).topSpaceToView(_views, y*autoSizeScaleY).heightIs(98*autoSizeScaleY);
    }
    
    
    UIView *line=[[UIView alloc]init];
    line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
    [_views addSubview:line];
    line.sd_layout.leftSpaceToView(_views, 0).rightSpaceToView(_views, 0).bottomSpaceToView(_views, 98*autoSizeScaleY).heightIs(1);
    
    
    UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.backgroundColor=[UIColor whiteColor];
    cancelBtn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [cancelBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
    [cancelBtn setTitle:Localized(@"取消") forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(oncANCELClick) forControlEvents:UIControlEventTouchUpInside];
    [_views addSubview:cancelBtn];
    cancelBtn.sd_layout.leftSpaceToView(_views, 0).rightSpaceToView(_views, 0).bottomSpaceToView(_views, 0).heightIs(98*autoSizeScaleY);
    
    // Do any additional setup after loading the view.
}
-(void)onButtonClick:(MyButton *)btn{
    [self dismissViewControllerAnimated:YES completion:^{
        [_delegate PaymentStatus:NO String:btn.string];
    }];
    

}
-(void)oncANCELClick{
   [self dismissViewControllerAnimated:YES completion:^{
       
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

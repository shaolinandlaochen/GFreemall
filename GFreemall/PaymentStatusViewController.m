//
//  PaymentStatusViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "PaymentStatusViewController.h"

@interface PaymentStatusViewController ()

@end

@implementation PaymentStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    autoSize
    
    for (int i=0; i<3; i++) {
        float y=0+(98+2)*(i/1);
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor=[UIColor whiteColor];
        btn.tag=i+1;
        btn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        if (i==0) {
            [btn setTitle:Localized(@"待支付") forState:UIControlStateNormal];
        }else if (i==1){
        [btn setTitle:Localized(@"成功") forState:UIControlStateNormal];
        }else if (i==2){
            [btn setTitle:Localized(@"失败") forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, y*autoSizeScaleY).heightIs(98*autoSizeScaleY);
    }
    
    
    UIView *line=[[UIView alloc]init];
    line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
    [self.view addSubview:line];
    line.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 98*autoSizeScaleY).heightIs(1);
    
    
    UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.backgroundColor=[UIColor whiteColor];
    cancelBtn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [cancelBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
    [cancelBtn setTitle:Localized(@"取消") forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(oncANCELClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    cancelBtn.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).heightIs(98*autoSizeScaleY);
    
    // Do any additional setup after loading the view.
}
-(void)onButtonClick:(UIButton *)btn{
[_delegate PaymentStatus:NO String:nil];
}
-(void)oncANCELClick{
    [_delegate PaymentStatus:NO String:nil];
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

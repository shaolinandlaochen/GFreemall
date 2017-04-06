//
//  TheLoginViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "TheLoginViewController.h"

@interface TheLoginViewController ()
{
    UIView *_numberView;
    UIImageView *img;
    UIButton *lingBtn;

}
@end

@implementation TheLoginViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    autoSize
    img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"bg001"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, 0).heightIs(434*autoSizeScaleY);
    [self creatView];
    // Do any additional setup after loading the view.
}
-(void)creatView{
autoSize
    _numberView=[[UIView  alloc]init];
    _numberView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_numberView];
    _numberView.sd_layout.leftEqualToView(img).rightEqualToView(img).topSpaceToView(img, 0).heightIs(96*autoSizeScaleY);
    for (int i=0; i<2; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i+1;
        btn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"292929"] forState:UIControlStateSelected];
         [btn setTitleColor:[TheParentClass colorWithHexString:@"999999"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onNumberClick:) forControlEvents:UIControlEventTouchUpInside];
        [_numberView addSubview:btn];
        if (i==0) {
            btn.selected=YES;
            [btn setTitle:Localized(@"密码登录") forState:UIControlStateNormal];
            btn.sd_layout.leftSpaceToView(_numberView, 0).topSpaceToView(_numberView, 0).widthIs(self.view.frame.size.width/2).bottomSpaceToView(_numberView, 3);
            
        }else{
            btn.selected=NO;
            [btn setTitle:Localized(@"验证码登录") forState:UIControlStateNormal];
            btn.sd_layout.leftSpaceToView(_numberView, self.view.frame.size.width/2).topSpaceToView(_numberView, 0).widthIs(self.view.frame.size.width/2).bottomSpaceToView(_numberView, 3);
        }
        
        
    }
     lingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    lingBtn.backgroundColor=[UIColor blackColor];
    lingBtn.frame=frame(105, 92, 161, 4);
    [_numberView addSubview:lingBtn];
    
    
    
}
//点击账号登录或者手机号登录
-(void)onNumberClick:(UIButton *)btn{
    autoSize
    for (int i=0; i<2; i++) {
        UIButton *button=(UIButton *)[_numberView viewWithTag:i+1];
        button.selected=NO;
    }
    btn.selected=YES;
    if (btn.tag==1) {
        [UIView animateWithDuration:0.5 animations:^{
            lingBtn.frame=frame(105, 92, 161, 4);
        }];
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            lingBtn.frame=frame(475, 92, 161, 4);
        }];
    }

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

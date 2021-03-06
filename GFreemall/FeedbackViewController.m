//
//  FeedbackViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "FeedbackViewController.h"
#import "setUpRequest.h"
@interface FeedbackViewController ()<UITextViewDelegate>
{
    UITextView *_tf;
    UILabel *lbl;

}
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"意见反馈");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    
    
    
    _tf=[[UITextView alloc]init];
    _tf.delegate=self;
    //_tf.contentInset = UIEdgeInsetsMake(24, 6, 0, 0);
    self.automaticallyAdjustsScrollViewInsets = NO;
    //_tf.keyboardType=UIKeyboardTypeDefault;
    _tf.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _tf.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [self.view addSubview:_tf];
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    _tf.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height).heightIs(300*autoSizeScaleY);
    
    lbl=[[UILabel alloc]init];
    lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
    lbl.text=Localized(@"请输入您的反馈内容...");
    lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(self.view, navheight+rectStatus.size.height+(25*autoSizeScaleY)).widthIs(600*autoSizeScaleX).heightIs(40*autoSizeScaleY);
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:Localized(@"提交") forState:UIControlStateNormal];
    btn.layer.cornerRadius = 6*autoSizeScaleX;
    btn.layer.masksToBounds = 6*autoSizeScaleX;
    btn.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor blackColor];
    [btn addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(_tf, 20*autoSizeScaleY).rightSpaceToView(self.view, 25*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
    
    
    // Do any additional setup after loading the view.
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    lbl.text=@"";
    return YES;
}


- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if ([textView.text length]<1||[textView.text isEqualToString:@" "]) {
        lbl.text=Localized(@"请输入您的反馈内容...");
    }
    return YES;
}
//提交
-(void)onButtonClick{
    if ([tokenString length]<1) {
         [TheParentClass theLogin];
    }else{
        NSLog(@"意见反馈开始发起请求");
        
        [setUpRequest feedback:_tf.text block:^(NSDictionary *dicDatas) {
            LoginBaseClass *lgClass=[[LoginBaseClass alloc]initWithDictionary:dicDatas];
            if ([lgClass.code isEqualToString:@"2"]) {
                [FTIndicator showSuccessWithMessage:lgClass.msg];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
             [FTIndicator showErrorWithMessage:lgClass.msg];
            }
           
            
        }];
    }

    

}

cancelClick
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

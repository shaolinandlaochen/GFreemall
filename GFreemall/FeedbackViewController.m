//
//  FeedbackViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "FeedbackViewController.h"

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
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    
    
    _tf=[[UITextView alloc]init];
    _tf.delegate=self;
    _tf.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _tf.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [self.view addSubview:_tf];
    _tf.frame=frame(0, 0, 750, 300);
    
    lbl=[[UILabel alloc]init];
    lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
    lbl.text=@"请输入您的反馈内容...";
    lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    lbl.frame=frame(25, 25, 700, 50);
    [_tf addSubview:lbl];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:Localized(@"提交") forState:UIControlStateNormal];
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
        lbl.text=@"请输入您的反馈内容...";
    }
    return YES;
}
//提交
-(void)onButtonClick{

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

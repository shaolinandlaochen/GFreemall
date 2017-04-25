//
//  EvaluationOfTheViewViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "EvaluationOfTheViewViewController.h"
#import "GoodsAndEvaluationRequest.h"
@interface EvaluationOfTheViewViewController ()<UITextViewDelegate>
{
    UIView *_view;
    UILabel *_message;
    UITextView *_tf;
    int xingxing;

}
@end

@implementation EvaluationOfTheViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    xingxing=5;
    self.title=Localized(@"评价晒单");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:Localized(@"提交") style:UIBarButtonItemStylePlain target:self action:@selector(onrightItemButtonClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
    [self.navigationItem.rightBarButtonItem setTintColor:[TheParentClass colorWithHexString:@"#ffffff"]];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:30*autoSizeScaleX],NSFontAttributeName, nil] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}
-(void)onrightItemButtonClick{
    if ([_tf.text length]<10) {
        [FTIndicator showInfoWithMessage:@"至少十个字哦"];
    }else if ([_tf.text length]>500){
       [FTIndicator showInfoWithMessage:@"评论不得大于五百字哦"];
    }else{
        [SVProgressHUD showWithStatus:@"正在加载"];
        [GoodsAndEvaluationRequest EvaluationOfBaskInSingle:self.order_serial comment_content:_tf.text comment_grade:xingxing commodity_serial:self.commodity_serial order_commodity_id:self.order_commodity_id block:^(NSDictionary *dics) {
            MessageBaseClass *class=[[MessageBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
            if ([class.code isEqualToString:@"61"]) {
                [self.navigationController popViewControllerAnimated:YES];
            }
            [FTIndicator showSuccessWithMessage:class.msg];
            
            [SVProgressHUD dismiss];
        }];
    }
   

}
cancelClick
-(void)CreatView{
    autoSize
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    _view=[[UIView alloc]init];
    _view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_view];
    _view.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height).rightSpaceToView(self.view, 0).heightIs(200*autoSizeScaleY);
    
    UIImageView *img=[[UIImageView alloc]init];
    [img sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491460531239&di=7465c82b0f0ab81da83713337695e0bf&imgtype=0&src=http%3A%2F%2Fpic2.nipic.com%2F20090427%2F47541_171444055_2.jpg"] placeholderImage:[UIImage imageNamed:@""]];
    [_view addSubview:img];
    img.sd_layout.leftSpaceToView(_view, 25*autoSizeScaleX).topSpaceToView(_view, 20*autoSizeScaleY).bottomSpaceToView(_view, 20*autoSizeScaleY).widthIs(160*autoSizeScaleX);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=Localized(@"评分");
    lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
    lbl.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [_view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(img, 32*autoSizeScaleX).topSpaceToView(_view, 45*autoSizeScaleY).widthIs(100*autoSizeScaleX).heightIs(35*autoSizeScaleY);
    
    for (int i=0; i<5; i++) {
        float x=30+(38+18)*(i%5);
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_star_red"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i+1;
        [_view addSubview:btn];
        btn.sd_layout.leftSpaceToView(img, x*autoSizeScaleX).topSpaceToView(lbl, 30*autoSizeScaleY).widthIs(38*autoSizeScaleX).heightIs(38*autoSizeScaleY);
    }
    _tf=[[UITextView alloc]init];
    _tf.delegate=self;
    _tf.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tf];
    _tf.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(_view, 0).rightSpaceToView(self.view, 0).heightIs(220*autoSizeScaleY);
    _message=[[UILabel alloc]init];
    _message.textColor=[TheParentClass colorWithHexString:@"#999999"];
    _message.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    _message.text=@"亲,写点评价吧,你的评价对其他买家有很大的帮助.";
    [self.view addSubview:_message];
    _message.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(_view, 25*autoSizeScaleY).rightSpaceToView(self.view, 25*autoSizeScaleX).heightIs(35*autoSizeScaleY);
    
    UIView *lineView=[[UIView alloc]init];
    lineView.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
    [self.view addSubview:lineView];
    lineView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(_tf, 1).heightIs(0.6);
    
    

}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    _message.text=@"";
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if ([textView.text length]==0||textView.text==nil||[textView.text isEqualToString:@" "]) {
        _message.text=@"亲,写点评价吧,你的评价对其他买家有很大的帮助.";
    }
    return YES;
}
-(void)onButtonClick:(UIButton *)btn{
    for (int i=0; i<5; i++) {
        UIButton *button=(UIButton *)[_view viewWithTag:i+1];
        if (i<btn.tag) {
           [button setBackgroundImage:[UIImage imageNamed:@"icon_star_red"] forState:UIControlStateNormal];
        }else{
            [button setBackgroundImage:[UIImage imageNamed:@"icon_star_empty"] forState:UIControlStateNormal];
        }
    }
    xingxing=btn.tag;
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

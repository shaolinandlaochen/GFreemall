//
//  MessageForDetailsViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MessageForDetailsViewController.h"

@interface MessageForDetailsViewController ()

@end

@implementation MessageForDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"消息详情");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    // Do any additional setup after loading the view.
}
cancelClick
-(void)CreatView{
    autoSize
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    UILabel *title=[[UILabel alloc]init];
    title.textAlignment=NSTextAlignmentCenter;
    title.textColor=[TheParentClass colorWithHexString:@"#292929"];
    title.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    title.numberOfLines=0;
    title.text=@"打狗棍多功能的观点粉身碎三方开个会";
    [self.view addSubview:title];
    title.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(self.view, navheight+rectStatus.size.height+(80*autoSizeScaleY)).rightSpaceToView(self.view, 25*autoSizeScaleX).autoHeightRatio(0);
    
    UILabel *context=[[UILabel alloc]init];
    context.textColor=[TheParentClass colorWithHexString:@"#292929"];
    context.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    context.numberOfLines=0;
    context.text=@"打狗棍多功能的观点粉身碎骨东莞市公司广东省手术费和私人医院虽然不是他让不少人也不说一声内容提要少年闰土妖孽人生探讨行业虽然讨厌他愤怒又是否会让他以后的方式跟第三方开个会";
    [self.view addSubview:context];
    context.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(title, 76*autoSizeScaleY).rightSpaceToView(self.view, 25*autoSizeScaleX).autoHeightRatio(0);
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

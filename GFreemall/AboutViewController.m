//
//  AboutViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"关于");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
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
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"logobj"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 250*autoSizeScaleX).rightSpaceToView(self.view, 250*autoSizeScaleX).topSpaceToView(self.view, navheight+rectStatus.size.height+(74*autoSizeScaleY)).heightIs(130*autoSizeScaleY);
    
    UILabel *context=[[UILabel alloc]init];
    context.textColor=[TheParentClass colorWithHexString:@"#292929"];
    context.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    context.text=Localized(@"Icoinmall是一家全球性跨境消费交易平台，商品种类涵盖服装、配饰、数码电子产品、化妆品、户外体育用品、家居等多个领域，让消费者轻松体验一站式全球好货，实现消费全球化。\n\n Icoinmall秉承正品保证、税费透明、物超所值、支付方便的经营宗旨，为消费者提供良好的购物体验。icoinmall的商品供应商都经过icoinmall的严格的筛选机制，对所售商品的质量检验均以行业内检验的最高合格为准则，避免了消费者买到次品和赝品的风险，所售的品牌商品在全球范围内的实体店均享有售后服务保障权益。所有订单根据区域内物流情况进行物流筛选匹配后配送，以保证商品发货后以最高效的物流效率、最优质的服务将商品送达每一位Icoinmall会员身边。");
    [self.view addSubview:context];
    context.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).rightSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(img, 78*autoSizeScaleY).autoHeightRatio(0);
    
    
    
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

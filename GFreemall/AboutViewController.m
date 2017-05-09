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
    
    UITextView *lbl=[[UITextView alloc]init];
    [lbl setEditable:NO];
    lbl.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
    [self.view addSubview:lbl];

    lbl.text=Localized(@"GFM（Global Free Mall）公司总部位于美国纽约，是中国愛加愛A+A Free mall控股的美国纽约子公司。 \n\nGFM 是首家真正的全球性电子商务平台，从公司创建伊始，其目标就是每周7天，每天24小时为全球市场提供最优质最能够提高生命质量的产品配方和技术。\n\nGFM所采用的产品配方和技术已被证明具有立竿见影的非凡效果，因而为全球的消费者带来最先进的前卫产品，同时也为全球具有企业家眼光的个人带来回报最丰富，最稳定的商机。\n\nGFM所提供的是一个独特的居家经商商机，结合了全球电子商务的最佳资源，并为其全球的销售团队提供现今最优秀和先进的业务模式，其销售团队所可获得的最高佣金比率高达50%。\n\nGFM不变的信念，就是以最优秀的能够改变生命的科技和配方来服务世界。公司以最诚恳和谦卑的态度，以服务产品用户和公司全球销售团队为己任。 公司的领袖有着神圣的使命感，将公司献上来服务这个世界，得着上帝的喜悦。\n\n在2017年3月 A+A Free Mall，这家在中国具有6年历史的室内健康环境科技龙头企业，通过向其全球独立经销商提供一个更广泛的A+A Free Mall 科技产品的销售网络，获得了一个独特的在全球拓展其业务的良机。在经过了多个月的可行性分析和论证， A+A Free Mall 的领导层意识到，为了在全球范围内提供这一成功的机遇，建立一个新的具有全球性策略和优越的奖励制度的公司是最佳的方案。而GFM就是这一策略的果实！ 今天，GFM是 A+A Free Mall 控股的子公司关系。通过可选择性地加入GFM的国际网络，GFM史无前例地为 A+A Free Mall 的经销商提供了通往全球性市场的途径。而GFM的经销商也史无前例地获得了 由A+A Free Mall提供的更为先进完善的全球科技技术产品。");
    lbl.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).rightSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(img, 78*autoSizeScaleY).bottomSpaceToView(self.view, 0);
    
    
    
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

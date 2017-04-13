//
//  Recommended.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/10.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "Recommended.h"
#import "RecommendedCell.h"
@interface Recommended ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}


@end

@implementation Recommended
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    
    [self CreatView];
    [self CreateTheTopNavigationBar];
    // Do any additional setup after loading the view.
}
-(void)CreateTheTopNavigationBar{
    autoSize
    
    UIView * colorsView=[[UIView alloc]init];
    colorsView.frame=CGRectMake(0, 0, self.view.frame.size.width, 127*autoSizeScaleY);
    [self.view addSubview:colorsView];
    
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
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
    UIButton * forwardingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [forwardingBtn setImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    [forwardingBtn addTarget:self action:@selector(onforwardingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [colorsView addSubview:forwardingBtn];
    forwardingBtn.sd_layout.rightSpaceToView(colorsView, 10*autoSizeScaleX).bottomSpaceToView(colorsView, 10*autoSizeScaleY).widthIs(68*autoSizeScaleX).heightIs(68*autoSizeScaleY);
    
    
    UILabel *  title=[[UILabel alloc]init];
    title.textColor=[TheParentClass colorWithHexString:@"#ffffff"];
    title.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    title.textAlignment=NSTextAlignmentCenter;
    [colorsView addSubview:title];
    title.sd_layout.leftSpaceToView(colorsView, 200*autoSizeScaleX).rightSpaceToView(colorsView, 200*autoSizeScaleX).bottomSpaceToView(colorsView, 25*autoSizeScaleY).heightIs(40*autoSizeScaleY);
    
    
}
//返回
-(void)onCanceClick{
    [_delegate RecommendedTheModalDelegateTheModal];
}
//转发
-(void)onforwardingBtnClick{
    
}
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
     CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    _tableView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, navheight).bottomSpaceToView(self.view, 98*autoSizeScaleY);
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 264*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendedCell *cell=[RecommendedCell new];
    cell.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    cell.bjImagge.image=[UIImage imageNamed:@""];
    cell.strings.text=@"第一轮A层";
    cell.timeStr.text=Localized(@"加入时间: 2016-12-02 12:08:42");
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
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

//
//  CountryCodeViewController.m
//  GFreemall
//
//  Created by 123 on 2017/4/26.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "CountryCodeViewController.h"

@interface CountryCodeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;

}
@end

@implementation CountryCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreatView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0*autoSizeScaleX).topSpaceToView(self.view, 700*autoSizeScaleY).rightSpaceToView(self.view, 0*autoSizeScaleX).bottomSpaceToView(self.view, 0*autoSizeScaleY);
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 98*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize

    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 80*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    autoSize
    UIView *view=[[UIView  alloc]init];
    view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    UILabel *lbl=[[UILabel alloc]init];
    lbl.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
    lbl.text=Localized(@"请选择您的手机号码所属国家");
    lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
    lbl.textAlignment=NSTextAlignmentCenter;
    [view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).bottomSpaceToView(view, 0).topSpaceToView(view, 0);
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return nil;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NULLCell *cell=[NULLCell new];
    cell.textLabel.text=self.array[indexPath.row];
    cell.textLabel.textColor=[TheParentClass colorWithHexString:@"#999999"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_delegate codes:indexPath.row];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

    
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

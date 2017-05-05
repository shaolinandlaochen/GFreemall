//
//  ChooseShippingAddressTwo.m
//  GFreemall
//
//  Created by 123 on 2017/4/19.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ChooseShippingAddressTwo.h"
#import "ChooseShippingAddressOne.h"
@interface ChooseShippingAddressTwo ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}


@end

@implementation ChooseShippingAddressTwo


- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    self.title=Localized(@"选择地址");
    // Do any additional setup after loading the view.
}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    autoSize
    
    
    
    return nil;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    AddressString *string=[AddressString CommodityClassificationModel:self.array[indexPath.row]];
    
    NULLCell  *cell=[NULLCell new];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",string.name];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic=self.array[indexPath.row];
    AddressString *string=[AddressString CommodityClassificationModel:dic];
    
    
    self.addressArray=[[NSMutableArray alloc]init];
    for (int i=0; i<self.addressStringArray.count; i++) {
        [self.addressArray addObject:self.addressStringArray[i]];
    }
    
    [self.addressArray addObject:[NSString stringWithFormat:@"%@",string.name]];
    if (string.list.count>0) {
        ChooseShippingAddressOne *one=[[ChooseShippingAddressOne alloc]init];
        one.array=string.list;
        one.why=@"选择地址";
         NSLog(@"%@",self.addressArray);
        one.addressStringArray=self.addressArray;
        [self.navigationController pushViewController:one animated:YES];
        
    }else{
        [_delegate ChooseShippingAddressTwoSelecAreaIs:self.addressArray];
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

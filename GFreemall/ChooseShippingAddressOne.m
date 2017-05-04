//
//  ChooseShippingAddressOne.m
//  GFreemall
//
//  Created by 123 on 2017/4/19.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ChooseShippingAddressOne.h"
#import "ChooseShippingAddressTwo.h"
@interface ChooseShippingAddressOne ()<UITableViewDelegate,UITableViewDataSource,ChooseShippingAddressTwoDelegate>
{
    UITableView *_tableView;
}

@end

@implementation ChooseShippingAddressOne

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    if (self.why!=nil&&[self.why isEqualToString:@"选择地址"]) {
        leftCancel
    }
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
        ChooseShippingAddressTwo *two=[[ChooseShippingAddressTwo alloc]init];
        two.delegate=self;
        two.array=string.list;
        two.addressStringArray=self.addressArray;
         NSLog(@"%@",self.addressArray);
        [self.navigationController pushViewController:two animated:YES];
        
    }else{
       
        [self ChooseShippingAddressTwoSelecAreaIs:self.addressArray];
    }
  
    
    
    
  
}
-(void)ChooseShippingAddressTwoSelecAreaIs:(NSArray *)array{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"SelectAreasss" object:array];
    [self dismissViewControllerAnimated:YES completion:^{
       
    }];

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

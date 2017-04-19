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
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    self.title=@"选择地址";
    // Do any additional setup after loading the view.
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
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"countries"]==nil) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",string.name] forKey:@"countries"];
    }else if ([[NSUserDefaults standardUserDefaults] valueForKey:@"provinces"]==nil){
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",string.name] forKey:@"provinces"];
    }else if ([[NSUserDefaults standardUserDefaults] valueForKey:@"city"]==nil){
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",string.name] forKey:@"city"];
    }else if ([[NSUserDefaults standardUserDefaults] valueForKey:@"area"]==nil){
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",string.name] forKey:@"area"];
    }
    
    if (string.list.count>0) {
        ChooseShippingAddressTwo *two=[[ChooseShippingAddressTwo alloc]init];
        two.delegate=self;
        two.array=string.list;
        [self.navigationController pushViewController:two animated:YES];
        
    }else{
       
        [self ChooseShippingAddressTwoSelecAreaIs];
    }
  
    
    
    
  
}
-(void)ChooseShippingAddressTwoSelecAreaIs{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"SelectAreasss" object:nil];
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

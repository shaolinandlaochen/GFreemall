//
//  paymentInformationView.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "paymentInformationView.h"
#import "AmountToShowCell.h"
#import "PaymentToShowCell.h"
#import "PayThePasswordCell.h"
#import "WalletBalanceTop_upCell.h"
@interface paymentInformationView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    MyButton *_button;
}

@end

@implementation paymentInformationView

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];
    [self caretView];
    // Do any additional setup after loading the view.
}
-(void)caretView{
    autoSize
    
    
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    view.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).heightIs(140*autoSizeScaleY);
    
    
    _button=[[MyButton alloc]init];
    _button.backgroundColor=[UIColor blackColor];
    [_button setTitle:Localized(@"确认支付") forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    _button.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).rightSpaceToView(self.view, 25*autoSizeScaleX).bottomSpaceToView(self.view, 20*autoSizeScaleY).heightIs(100*autoSizeScaleY);
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(_button, 20*autoSizeScaleY).topSpaceToView(self.view, 450*autoSizeScaleY);


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 248*autoSizeScaleY;
        }else if (indexPath.row==1){
            return 99*autoSizeScaleY;
        }
    }else if (indexPath.section==1){
    
        if ([self.were isEqualToString:@"爱积分支付"]) {
            
            return 99*autoSizeScaleY;
            
        }else if ([self.were isEqualToString:@"在线钱包"]){
            return 160*autoSizeScaleY;
        }
    }
    return 99*autoSizeScaleY;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if (section==0) {
        return 100*autoSizeScaleY;
    }else{
        return 0;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
    if (section==0) {
        autoSize
        UIView *view=[[UIView alloc]init];
        view.backgroundColor=[UIColor whiteColor];
        //叉号
        UIButton *btn=[[UIButton alloc]init];
        [btn setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(oncloseClick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        btn.sd_layout.rightSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 25*autoSizeScaleY).widthIs(50*autoSizeScaleX).heightIs(50*autoSizeScaleY);
        UILabel *name=[[UILabel alloc]init];
        name.textColor=[TheParentClass colorWithHexString:@"#000000"];
        name.font=[UIFont systemFontOfSize:42*autoSizeScaleY];
        name.textAlignment=NSTextAlignmentCenter;
        name.text=self.were;
        [view addSubview:name];
        name.sd_layout.leftSpaceToView(view, 0).topSpaceToView(view, 0).bottomSpaceToView(view, 0).rightSpaceToView(view, 0);
        
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [view addSubview:line];
        line.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).bottomSpaceToView(view, 0).heightIs(0.6);
        
        return view;
    }
    
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
       
        return 2;
    }else if (section==1){
        
        if ([self.were isEqualToString:@"爱积分支付"]) {
            
            return 2;
            
        }else if ([self.were isEqualToString:@"在线钱包"]){
            return 1;
        }
    }else{
        return 1;
    }
    
    
    return 0;
 
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            AmountToShowCell *cell=[AmountToShowCell new];
            cell.userInteractionEnabled = NO;
            return cell;
        }else if (indexPath.row==1){
            PaymentToShowCell *cell=[PaymentToShowCell new];
            cell.userInteractionEnabled = NO;
            cell.name.text=self.were;
            cell.context.text=Localized(@"支付方式");
            return cell;
        }
    }else if (indexPath.section==1){
        if ([self.were isEqualToString:@"爱积分支付"]) {
            
            PaymentToShowCell *cell=[PaymentToShowCell new];
            if (indexPath.row==0) {
                cell.name.text=Localized(@"GFM价格");
                cell.context.text=Localized(@"支付方式");
            }else if (indexPath.row==1){
                
                cell.name.text=Localized(@"GFM支付金额");;
                cell.context.text=Localized(@"支付方式");
            }
            return cell;
            
        }else if ([self.were isEqualToString:@"在线钱包"]){
            NSLog(@"dsfsfsf");
            WalletBalanceTop_upCell *CELL=[WalletBalanceTop_upCell new];
            [CELL.btn addTarget:self action:@selector(oTop_UpClick) forControlEvents:UIControlEventTouchUpInside];
            return CELL;
        }
    }else if (indexPath.section==2){
        PayThePasswordCell *cell=[PayThePasswordCell new];
        return cell;
    }
    
    
    NULLCell *cell=[NULLCell new];
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(void)onCancelClick{
  

}
//开始支付
-(void)onButtonClick{

}
//点击叉号
-(void)oncloseClick{
    [_delegate CancelTheView];
}
//充值
-(void)oTop_UpClick{
    [_delegate oTop_UpGo];
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

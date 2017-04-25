//
//  TimeViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()
{
    UILabel *times;
    UIView *_views;
}
@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    
    _views=[[UIView alloc]init];
    _views.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_views];
    _views.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).heightIs(self.view.frame.size.height/2);
    
    
    times=[[UILabel alloc]init];
    times.textColor=[TheParentClass colorWithHexString:@"#292929"];
    times.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    times.textAlignment=NSTextAlignmentCenter;
    [_views addSubview:times];
    times.sd_layout.leftSpaceToView(_views,200*autoSizeScaleX).rightSpaceToView(_views, 200*autoSizeScaleX).topSpaceToView(_views, 0).heightIs(100*autoSizeScaleY);
    
    //当前时间
     NSString *dataTimes=  [self GetTomorrowDay:[NSDate date]];
    
    times.text=[self SegmentationOfTime:dataTimes];
    
    
    UIButton *cancel=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancel setTitle:Localized(@"取消") forState:UIControlStateNormal];
    cancel.titleLabel.font=[UIFont systemFontOfSize:35*autoSizeScaleY];
    [cancel addTarget:self action:@selector(onCancelClick) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
    [_views addSubview:cancel];
    cancel.sd_layout.leftSpaceToView(_views, 25*autoSizeScaleX).topSpaceToView(_views, 0).widthIs(150*autoSizeScaleX).heightIs(100*autoSizeScaleY);
    
    
    UIButton *goBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [goBtn setTitle:Localized(@"确定") forState:UIControlStateNormal];
    goBtn.titleLabel.font=[UIFont systemFontOfSize:35*autoSizeScaleY];
    [goBtn addTarget:self action:@selector(onYesGoClick) forControlEvents:UIControlEventTouchUpInside];
    [goBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
    [_views addSubview:goBtn];
    goBtn.sd_layout.rightSpaceToView(_views, 25*autoSizeScaleX).topSpaceToView(_views, 0).widthIs(150*autoSizeScaleX).heightIs(100*autoSizeScaleY);
    
    
    
    
    
    
    
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
    [_views addSubview:view];
    view.sd_layout.leftSpaceToView(_views, 0).rightSpaceToView(_views, 0).topSpaceToView(times, 0).heightIs(0.6);
    
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    //设置日期选择控件的地区,中国地区标识是："zh_Hans_CN"或者"zh_CN"
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    // 设置当前显示时间
    [datePicker setDate:[NSDate date] animated:YES];

    //最大今天
    datePicker.maximumDate = [NSDate date];
    // 设置UIDatePicker的显示模式
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    //datePicker.minimumDate = [NSDate dateWithTimeIntervalSince1970:0];
    [datePicker addTarget:self action:@selector(onDatePickerClick:) forControlEvents:UIControlEventValueChanged];
    
    [_views addSubview:datePicker];
    datePicker.sd_layout.leftSpaceToView(_views, 200*autoSizeScaleX).topSpaceToView(view, 0).bottomSpaceToView(_views, 100*autoSizeScaleY).widthIs(500*autoSizeScaleX);
    
    
    UIView *bjView=[[UIView alloc]init];
    bjView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [_views addSubview:bjView];
    bjView.sd_layout.rightSpaceToView(_views, 0).topEqualToView(datePicker).bottomEqualToView(datePicker).widthIs(250*autoSizeScaleX);
    
    
    // Do any additional setup after loading the view.
}
//选择完毕时间执行该方法
-(void)onDatePickerClick:(UIDatePicker *)pick{
    
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *  currentTime=[formatter stringFromDate:pick.date];
    //字符串分隔
    NSArray *timeArray=[currentTime componentsSeparatedByString:@" "];
    NSString *time=[NSString stringWithFormat:@"%@",timeArray[0]];
    NSLog(@"当前选择时间%@",time);
    
    times.text=[self SegmentationOfTime:time];

}
-(NSString *)GetTomorrowDay:(NSDate *)aDate {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day])];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}

//取消
-(void)onCancelClick{
   [self dismissViewControllerAnimated:YES completion:^{
       
   }];

}
//确定
-(void)onYesGoClick{
    [self dismissViewControllerAnimated:YES completion:^{
         [_delegate ToChooseTime:YES String:times.text];
    }];

}
//将日期分割开
-(NSString *)SegmentationOfTime:(NSString *)time{
    NSString *string;
    NSArray *strArray=[time componentsSeparatedByString:@"-"];
    string=[NSString stringWithFormat:@"%@-%@",strArray[0],strArray[1]];

    return string;
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

//
//  HomePageViewsViewController.m
//  GFreemall
//
//  Created by 123 on 2017/4/19.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "HomePageViewsViewController.h"

@interface HomePageViewsViewController ()

@end

@implementation HomePageViewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    autoSize
//    for (int i=0; i<30; i++) {
//        float weight=WIDTH/3;
//        float x=0+(weight+0)*(i%3);
//        float y=0+(250+130)*(i/3);
//        MyButton *btn=[[MyButton alloc]init];
//        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        btn.tag=i+1;
//        [self.view addSubview:btn];
//        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490897527302&di=0a542cf1b83fe58e46c76f2bd4e42210&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fexp%2Fw%3D200%2Fsign%3D2f1b862431fae6cd0cb4ac613fb30f9e%2Ff9198618367adab4f2dd7c508fd4b31c8701e490.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
//        btn.sd_layout.leftSpaceToView(self.view, x).topSpaceToView(self.view, y*autoSizeScaleY).widthIs(250*autoSizeScaleX).heightIs(250*autoSizeScaleY);
//        
//        
//        UILabel *name=[[UILabel alloc]init];
//        name.tag=i+100;
//        name.text=@"我是名字";
//        
//        name.textAlignment=NSTextAlignmentCenter;
//        name.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
//        name.textColor=[TheParentClass colorWithHexString:@"#292929"];
//        [self.view addSubview:name];
//        name.sd_layout.leftSpaceToView(self.view, x).topSpaceToView(btn, 14*autoSizeScaleY).widthIs(weight).heightIs(30*autoSizeScaleY);
//        
//        
//        UILabel *pic=[[UILabel alloc]init];
//        pic.tag=i+200;
//        pic.text=@"¥2000";
//        pic.textAlignment=NSTextAlignmentCenter;
//        pic.textColor=[TheParentClass colorWithHexString:@"#de0024"];
//        pic.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
//        [self.view addSubview:pic];
//        pic.sd_layout.leftSpaceToView(self.view, x).topSpaceToView(name, 24*autoSizeScaleY).widthIs(weight).heightIs(30*autoSizeScaleY);
//        
//        
//    }
    
   
    // Do any additional setup after loading the view.
}
-(void)setDic:(NSDictionary *)dic{
    

}
-(void)onButtonClick:(MyButton *)btn{

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

//
//  ViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_imgsArray;//底部按钮未选中状态下背景图片名称
    NSArray *_selsctedBtnImages;//底部按钮选中状态下背景图片名称
    UIView *_bgrangdView;//地下按钮背景
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataCrollers];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ToWwitchBetweenLanguagesClick) name:@"ToWwitchBetweenLanguages" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)ToWwitchBetweenLanguagesClick{
    //接收通知切换语言
    [SVProgressHUD showWithStatus:Localized(@"loading")];
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self dataCrollers];
}
-(void)dataCrollers{
    self.ParentClass=[[TheParentClass alloc]init];
    
    HomeViewController *home=[[HomeViewController alloc]init];
    UINavigationController *homeNav=[[UINavigationController alloc]initWithRootViewController:home];
    
    ClassificationViewController *class=[[ClassificationViewController alloc]init];
    UINavigationController *classNav=[[UINavigationController alloc]initWithRootViewController:class];
    
    GFMViewController *GFM=[[GFMViewController alloc]init];
    UINavigationController *GFMNav=[[UINavigationController alloc]initWithRootViewController:GFM];
    
    ShoppingCartViewController *shoping=[[ShoppingCartViewController alloc]init];
    UINavigationController *shopingNav=[[UINavigationController alloc]initWithRootViewController:shoping];
    
    MyViewController *my=[[MyViewController alloc]init];
    UINavigationController *myNav=[[UINavigationController alloc]initWithRootViewController:my];
    
    
    self.array=@[homeNav,classNav,GFMNav,shopingNav,myNav];
    self.index=0;
    [self createButton];

}
colorWithStr
//创建底部按钮
-(void)createButton{
   
    autoSize
    _bgrangdView=[[UIView alloc]init];
    _bgrangdView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_bgrangdView];
    _bgrangdView.sd_layout.leftSpaceToView(self.view, 0).widthIs(self.view.frame.size.width).heightIs(98*autoSizeScaleY).bottomSpaceToView(self.view, 0);
    _imgsArray=@[@"icon_home",@"icon_classify",@"icon_gfm",@"icon_cart",@"icon_mine"];
    _selsctedBtnImages=@[@"icon_home_s",@"icon_classify_s",@"icon_gfm_s",@"icon_cart_s",@"icon_mine_s"];
    for (int i=0; i<5; i++) {
        float x=55+(60+85)*(i%5);
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:_imgsArray[i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:_selsctedBtnImages[i]] forState:UIControlStateSelected];
        if (i==0) {
            btn.selected=YES;
        }else{
            btn.selected=NO;
        }
        btn.tag=i+1;
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bgrangdView addSubview:btn];
        btn.sd_layout.bottomSpaceToView(_bgrangdView, 0).leftSpaceToView(_bgrangdView, x*autoSizeScaleX).widthIs(60*autoSizeScaleX).heightIs(98*autoSizeScaleY);
    }
}
//点击底部按钮触发方法
-(void)onButtonClick:(UIButton *)btn{
    if (btn.tag==_index+1) {
        return;
    }else{
        self.index=btn.tag-1;
        for (int i=1; i<6; i++) {
            UIButton *button=(UIButton *)[_bgrangdView viewWithTag:i];
            button.selected=NO;
        }
        btn.selected=YES;
    }
}
//set方法
-(void)setIndex:(NSInteger)index{
    if (_index==index) {
       // return;
    }
    if (_index>=0) {
        UIViewController *contrlooer=[self.array objectAtIndex:_index];
        [contrlooer.view removeFromSuperview];
    }
    UIViewController *viewcontroller=[self.array objectAtIndex:index];
    [self.view addSubview:viewcontroller.view];
    [self.view sendSubviewToBack:viewcontroller.view];
    _index=index;
}
//重写父类方法
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _index=-10;
        
    }
    return self;
    
}
//颜色值
+(UIColor *)colorWithHexString:(NSString *)color{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

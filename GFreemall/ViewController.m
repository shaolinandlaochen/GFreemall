//
//  ViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataCrollers];
    // Do any additional setup after loading the view, typically from a nib.
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
    
    
    self.ParentClass.array=@[homeNav,classNav,GFMNav,shopingNav,myNav];
    UIWindow *window=[[UIApplication sharedApplication].delegate window];
    window.rootViewController=self.ParentClass;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

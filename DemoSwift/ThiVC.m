//
//  ThiVC.m
//  DemoSwift
//
//  Created by chenzm on 2018/5/17.
//  Copyright © 2018年 chenzm. All rights reserved.
//

#import "ThiVC.h"
#import "DemoSwift-Swift.h"
@interface ThiVC ()

@end

@implementation ThiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    !self.thiBlock?:self.thiBlock(@"swift调用oc代码块");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    FourVC *vc = [FourVC new];
    
    // --- 属性传值 ---
    vc.arr0 = @[@"可以",@"可以",@"可以"];
    
    /// ------ 方法调用 -----
    
    //无参数无返回值
    [vc swMethod0];
    //有参数无返回值
    [vc swMethod1WithStr:@"dasda"];
    //有参数有返回值
    NSString *str = [vc swMethod2WithStr:@"sdfasda"];
    NSLog(@"%@",str);
    
    /// ------ 代码块调用 -----

    [vc bkBlock0WithResponse:^{
        NSLog(@"无返回数据代码块");
    }];
    
    //有一个返回值
    [vc bkBlock1WithResponse:^(NSString * str) {
        NSLog(@"%@", str);
    }];
    
    //有两个返回值
    [vc bkBlock_2_WithResponse:^(id str, id str1) {
        NSLog(@"%@\n%@",str1,str);
    }];
    
    //有参数有返回值
    [vc bkBlock3WithP1:@"ds" p2:@"dsa" p3:@"das" res:^(id p0,id p1, id p2, id p3) {
        NSLog(@"%@\n%@\n%@\n%@",p0,p1,p2,p3);
    }];
    
    [self presentViewController:vc animated:YES completion:^{
        
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

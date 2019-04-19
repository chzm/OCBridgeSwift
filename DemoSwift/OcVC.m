//
//  OcVC.m
//  DemoSwift
//
//  Created by chenzm on 2018/5/17.
//  Copyright © 2018年 chenzm. All rights reserved.
//

#import "OcVC.h"
#import "DemoSwift-Swift.h"

@interface OcVC ()

@end

@implementation OcVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"%@",self.titStr);
    !self.clickBlock?:self.clickBlock();
}

-(void)testAction{
    NSLog(@"调用方法");
}

-(void)clickAction:(void (^)(NSString *))res{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
//    ZMImgSelVC *forthViewVC = [[ZMImgSelVC alloc]init];
//
//    [self presentViewController:forthViewVC animated:YES completion:nil];
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

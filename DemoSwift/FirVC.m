//
//  FirVC.m
//  DemoSwift
//
//  Created by chenzm on 2018/5/17.
//  Copyright © 2018年 chenzm. All rights reserved.
//

#import "FirVC.h"
#import "DemoSwift-Swift.h"

///1、签署协议
@interface FirVC ()<FourVCDelegate>

///
@property(nonatomic,strong)SecVC *seVc;


@end

@implementation FirVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self addNotification];
}


#pragma mark - notification
-(void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiAction:) name:@"XMNotification" object:nil];
}

-(void)notiAction:(NSNotification *)sender{
    NSLog(@"oc:%@",sender.object);
}

-(void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"XMNotification" object:nil];
}

-(void)dealloc{
    [self removeNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self presentViewController:self.seVc animated:YES completion:^{
    }];
}

///调用协议方法
-(void)backSuperVCWithStr:(NSString *)str{
    NSLog(@"%@", str);
}

-(SecVC *)seVc{
    if (!_seVc) {
        _seVc = [SecVC new];
        _seVc.myDelegate = self;
    }
    return _seVc;
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

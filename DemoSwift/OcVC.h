//
//  OcVC.h
//  DemoSwift
//
//  Created by chenzm on 2018/5/17.
//  Copyright © 2018年 chenzm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OcVC : UIViewController

///代码块
@property(nonatomic,strong)void (^clickBlock)(void);
///字符串
@property(nonatomic,copy)NSString *titStr;
///方法
-(void)testAction;
@end

//
//  ThiVC.h
//  DemoSwift
//
//  Created by chenzm on 2018/5/17.
//  Copyright © 2018年 chenzm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThiVC : UIViewController

@property(nonatomic,strong)void (^thiBlock)(NSString *str);


@end

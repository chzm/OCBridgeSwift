//
//  FifVC.swift
//  DemoSwift
//
//  Created by chenzm on 2018/5/18.
//  Copyright © 2018年 chenzm. All rights reserved.
//

import UIKit

class FifVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.jumpToNextVC();
        self.touchesBeganAction(touches, with: event!);
    }
    
    func touchesBeganAction(_ fouches:Set<UITouch>,with event:UIEvent){
        
    }
    
    func jumpToNextVC(){
        ///mark - =============
        let foVC =  FourVC()
        
        let dic:NSDictionary = ["key":1,"key1":2];
        let arr0:NSMutableArray = ["你好","好不好"];
        
        // mark -  属性传值
        foVC.arr0 = arr0;
        
        //方法调用
        foVC.swMethod0();
        foVC.swMethod1(str: "da");
        let str = foVC.swMethod2(str: "ddd");
        print(str);
        
        // mark -  代码块回调
        foVC.bkBlock0 {
            print("你可以的");
        };
        foVC.bkBlock1 { (res) in
            print(res);
        }
        foVC.bkBlock_2_{ (res, str) in
            print(res, "+", str);
        }
        foVC.bkBlock3(p1: "1", p2: "2", p3: "3") { (res0, res1, res2, res3) in
            print(res0,res1,res2,res3);
        }
        self.present(foVC, animated: true) {
            
        };
    }

}

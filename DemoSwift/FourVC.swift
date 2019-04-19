//
//  FourVC.swift
//  DemoSwift
//
//  Created by chenzm on 2018/5/17.
//  Copyright © 2018年 chenzm. All rights reserved.
//

import UIKit

class FourVC: UIViewController {

    ///数组
    @objc var arr0:NSArray = NSArray()
    
    
    ///无参数无返回值
    @objc func swMethod0(){
        print("无参数无返回值");
    }
    ///有参数无返回值
    @objc func swMethod1(str: String)  {
        print("有参数无返回值:\(str)");
    }
    ///有参数有返回值
    @objc func swMethod2(str: String) -> (String){
        return "有参数有返回值:" + str;
    }

    /// mark - 代码块
    ///无返回参数
    @objc func bkBlock0(response:() -> ()){
        response();
    }
    ///返回一个字符串参数
    @objc func bkBlock1(response:(_ res : String) -> ()) {
        response("返回一个字符串参数");
    }
    ///返回多个任意类型参数
    @objc func bkBlock_2_(response:(_ res : Any,_ res1 : Any) -> ()) {
        response(self.arr0, "无参数，返回多个任意类型参数:");
    }
    ///传入多个参数 并返回多个任意类型的参数
    @objc func bkBlock3(p1:Any,p2:Any,p3:Any,res:(_ res0 : Any ,_ res1 : Any ,_ res2:Any,_ res3:Any) -> ()) {
        res("传入多个参数 并返回多个任意类型的参数:\n",p1, p2, p3);
    }
    ///Block带返回值
    @objc func bkBlock4(res:() -> ()) -> (String){
        res();
        return "Block带返回值"
    }
    
    
    //定义block
    typealias fucBlock = (_ backMsg : String?) ->()
    func bkBlock4(cmdStr:String?,blockProperty:fucBlock){
        blockProperty("backMsg---by block inside func")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow;
        print("属性传值结果：",self.arr0[0],self.arr0[1],arr0[2]);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true) {

        };
    }
}

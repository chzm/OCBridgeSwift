//
//  SecVC.swift
//  DemoSwift
//
//  Created by chenzm on 2018/5/17.
//  Copyright © 2018年 chenzm. All rights reserved.
//

import UIKit
import Foundation

///1、编辑协议
@objc(FourVCDelegate)
protocol FourVCDelegate {
    func backSuperVC(str:String)
}


class SecVC: UIViewController{

    ///2、定义协议对象
    @objc var myDelegate:FourVCDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow;
        self.addNotification();
    }

    
    //mark - Notifition
    
    @objc func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(notificationAction(_:)), name: NSNotification.Name(rawValue: "XMNotification"), object: nil);
    }
    @objc func removeNotifition() {
        NotificationCenter.default.removeObserver(self);
    }
    
    @objc private func notificationAction(_ noti : Notification){
        let str:String = noti.object as! String;
        print("swift:" + str);
    }
    deinit {
        self.removeNotifition();
    }

    ///mark -  通知发送
    func postNotifition(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "XMNotification"), object: "通知方法");
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ///返回上一级页面
        self.dismiss(animated: true) {
            self.postNotifition();
            ///3、调用协议
            let str:String = "代理方法"
            self.myDelegate?.backSuperVC(str: str);
        };
    }
}

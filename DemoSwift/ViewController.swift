//
//  ViewController.swift
//  DemoSwift
//
//  Created by chenzm on 2018/5/15.
//  Copyright © 2018年 chenzm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let buttion:UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addBtn();
    }

    
    // ================ View
    @objc func addBtn(){
        buttion.backgroundColor = UIColor.red;
        buttion.frame = CGRect(x: 0, y: 0, width: 80, height: 80);
        buttion.center = self.view.center;
        buttion.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside);
        buttion.tag = 10;
        self.view.addSubview(buttion);
        self.view.backgroundColor = UIColor.white;
    }
    
    // ============= Action
    @objc func btnAction(_ sender:UIButton){
        let subVC  = SubVC();
        self.present(subVC, animated: true) {
            NSLog("👺👺👺:%@", subVC);
        };
        NSLog("👺👺👺:%@____%@",sender,self);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


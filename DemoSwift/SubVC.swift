//
//  SubVC.swift
//  DemoSwift
//
//  Created by chenzm on 2018/5/15.
//  Copyright © 2018年 chenzm. All rights reserved.
//

import UIKit

class ViewConfig: NSObject {
    var viewBgColor :UIColor = UIColor.yellow
    var dataArr :NSArray = ["0、返回上一级页面","1、oc调用swift通知与代理方法","2、oc调用swift代码块、属性传值、方法","3、swift调用oc方法、属性传值、方法","4、swift调用swift方法、属性传值、方法",]
}


class SubVC: UIViewController {
    var arr :NSMutableArray = NSMutableArray.init();
    var config :ViewConfig = ViewConfig();
    
    
    let tableView:UITableView = UITableView();
    
    override func viewDidLoad() {
        self.setUpData();
        self.setUpUI();
    }

    @objc func setUpData(){
        //["返回0","返回1","返回2",]
        arr.addObjects(from: config.dataArr as! [Any]);
    }
    @objc func setUpUI(){
        self.view.backgroundColor = config.viewBgColor;
        self.addTableView();
        
    }
    
    @objc func addTableView(){
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.frame = CGRect(x: 0, y: 60, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 60);
        self.view.addSubview(self.tableView);
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



extension SubVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell0 = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.classForCoder()));
        if (cell0 == nil) {
            cell0 = UITableViewCell(style: .default, reuseIdentifier: NSStringFromClass(UITableViewCell.classForCoder()));
            cell0?.accessoryType = .disclosureIndicator;
        }
        cell0?.textLabel?.font = UIFont.systemFont(ofSize: 14);
        cell0?.textLabel?.text = arr[indexPath.row] as? String;
        
        return cell0!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       ZMSpeedy.zm_showViewByAnimation_BMR_(with: self.view.layer, duraton: 0.3)
        if indexPath.row == 0 {
            self.dismiss(animated: true) {
                NSLog("返回");
            };
        }else if indexPath.row == 1{
            let fiVC  = FirVC();
            self.present(fiVC, animated: true, completion: {
                
            });
        }else if indexPath.row == 2{
            let vc  = ThiVC();
            vc.thiBlock = {(str) -> () in
                print("代码块方法")
            }
            self.present(vc, animated: true, completion: {
                
            });
        }else if indexPath.row == 3{
            let sub  = OcVC();
            //属性传值
            sub.titStr = "属性传值";
            //方法调用
            sub.testAction();
            
            //代码块调用
            sub.clickBlock = { () -> () in
                print("不带参数代码块")
            };
            
            sub.clickBlock();
            self.present(sub, animated: true, completion: {
                
            });
        }else if indexPath.row == 4 {
            let vc = FifVC();
            self.present(vc, animated: true, completion: {
                
            });
            
        }
        
    }
}

//
//  SwiftMicros.swift
//  DemoSwift
//
//  Created by chenzm on 2018/5/16.
//  Copyright © 2018年 chenzm. All rights reserved.
//

import UIKit
//import Foundation
let kIphone_h = UIScreen.main.bounds.size.height;
let kIphone_w = UIScreen.main.bounds.size.width;
/// tabbar切换视图控制器高度
let kTabbar_h = 49.0
/// 搜索视图高度
let kSearchBarHeight = 45.0
/// 状态栏高度
let kStatusBar_h = 20.0
/// 导航栏高度
let kNavi_h = 44.0
//视图高度
func kView_h(_ v:UIView) -> CGFloat{
    return v.bounds.size.height;
}
///视图宽度
func kView_w(_ v:UIView) -> CGFloat{
    return v.bounds.size.width;
}
///视图宽高
func kView_size(_ v:UIView) -> CGSize{
    return v.bounds.size;
}

func kRGBColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

func kRGBAColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
}


func kIsEmptyStr(str:String) -> Bool {
    if (str == ""||str.isEmpty) {
        return true;
    }else{
        return false;
    }
}

// MARK: - 设备信息

/// 当前app信息
let kAppInfo = Bundle.main.infoDictionary
/// 当前app版本号
let kAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
/// 获取设备系统号
let kSystemVersion = UIDevice.current.systemVersion


/// iPhone设备
let kIsIPhone = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? true : false)
/// iPad设备
let kIsIPad = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? true : false)
/// iPhone4设备
let kIsIPhone4 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) < 568.0 ? true : false)
/// iPhone5设备
let kIsIPhone5 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 568.0 ? true : false)
/// iPhone6设备
let kIsIPhone6 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 667.0 ? true : false)
/// iPhone6Plus设备
let kIsIPhone6P = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 736.0 ? true : false)

///颜色设置
let kRedColor = UIColor.red;
let kBlackColor = UIColor.black;
let kDarkGrayRedColor = UIColor.darkGray;
let kLightGrayColor = UIColor.lightGray;
let kWhiteColor = UIColor.white;
let kClearColor = UIColor.clear;
let kOrangeColor = UIColor.orange;

// MARK: - 时间格式
enum kTimeFormat:String
{
    case format_yyyyMMddHHmmssSSS         = "yyyy-MM-dd HH:mm:ss.SSS"
    case format_yyyyMMddHHmmss            = "yyyy-MM-dd HH:mm:ss"
    case format_yyyyMMddHHmm              = "yyyy-MM-dd HH:mm"
    case format_yyyyMMdd                  = "yyyy-MM-dd"
    case format_yyyyMMdd_slash            = "yyyy/MM/dd"
    case format_yyyyMMdd_dot              = "yyyy.MM.dd"
    case format_yyyyMM                    = "yyyy-MM"
    case format_yyMMddHHmm                = "yy-MM-dd HH:mm"
    case format_yyMMdd                    = "yy-MM-dd"
    
    case format_MMddHHmmss                = "MM-dd HH:mm:ss"
    case format_MMddHHmm                  = "MM-dd HH:mm"
    case format_MMdd                      = "MM-dd"
    
    case format_HHmmss                    = "HH:mm:ss"
    case format_HHmm                      = "HH:mm"
    
    case format_yyyyMMdd_series           = "yyyyMMdd"
    case format_yyyyMMddHHmmss_series     = "yyyyMMddHHmmss"
    case format_yyyyMMddHHmmssSSS_series  = "yyyyMMddHHmmssSSS"
}



///打印日志
func DeLog<T>(_ msg:T,fileName:String = #file,methodName:String = #function,lineNum:Int = #line){
    #if DEBUG
        let logStr = fileName.components(separatedBy: "/").last!.replacingOccurrences(of: "swift", with: "");
        print("类：\(logStr) 行：[\(lineNum)] 方法：\(methodName) 数据：\(msg)")
    #endif
}

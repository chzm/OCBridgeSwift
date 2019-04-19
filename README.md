# OCBridgeSwiftToCall[OC与swift的数据传输]


## 简介

该项目主要介绍了oc与swift之间、swift内部几种常见的传值方式（属性传值、代码块传值、代理传值、通知）

如果oc与swift之间的桥接有疑问请参考：[oc与swift的相互调用](https://gitee.com/chenzm_186/OCBrigdeSwiftDemo)
## 项目介绍
> * 1、swift之间的页面跳转与返回
> * 2、oc监听swift推送的通知
> * 3、swift内部推送接收的通知
> * 4、oc调用swift的代理方法
> * 5、swift调用oc代码块
> * 6、oc对swift的属性传值、方法调用、代码块调用
> * 7、swift对oc的属性传值、方法调用、代码块调用
> * 8、swift之间的传值

----

### 1、swift之间的页面跳转与返回

1、present方式跳转

```swift
@objc func btnAction(_ sender:UIButton){
let subVC  = SubVC();
self.present(subVC, animated: true) {
NSLog("👺👺👺:%@", subVC);
};
NSLog("👺👺👺:%@____%@",sender,self);
}
```
2、返回

```swift
self.dismiss(animated: true) {
NSLog("返回");
};
```

### 2、oc监听swift推送的通知：

- swift发送通知
```swift
func postNotifition(){
NotificationCenter.default.post(name: NSNotification.Name(rawValue: "XMNotification"), object: "通知方法");
}
```

- oc接收通知
```oc
-(void)addNotification{
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiAction:) name:@"XMNotification" object:nil];
}

-(void)notiAction:(NSNotification *)sender{
NSLog(@"oc:%@",sender.object);
}

-(void)removeNotification{
[[NSNotificationCenter defaultCenter] removeObserver:self name:@"XMNotification" object:nil];
}

```

### 3、swift内部推送接收的通知：

```swift
func postNotifition(){
NotificationCenter.default.post(name: NSNotification.Name(rawValue: "XMNotification"), object: "通知方法");
}

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
```
![通知打印结果][1]

### 4、oc调用swift的代理方法：

- 编辑协议方
```swift
///1、编辑协议
@objc(FourVCDelegate)
protocol FourVCDelegate {
func backSuperVC(str:String)
}

///2、定义协议对象
@objc var myDelegate:FourVCDelegate?;

///3、调用协议
let str:String = "代理方法"
self.myDelegate?.backSuperVC(str: str);
```

- 签署协议方
```oc
///1、调用协议
@interface FirVC ()<FourVCDelegate>

///2、签署协议
-(SecVC *)seVc{
if (!_seVc) {
_seVc = [SecVC new];
_seVc.myDelegate = self;
}
return _seVc;
}

///3、协议实现
-(void)backSuperVCWithStr:(NSString *)str{
NSLog(@"%@", str);
}

```
![代理协议打印结果][2]

###5、swift调用oc代码块

- oc文件类
```oc
///代码块定义
@property(nonatomic,strong)void (^thiBlock)(NSString *str);

///代码块实现
!self.thiBlock?:self.thiBlock(@"swift调用oc代码块");
```
- swift文件类
```swift

let vc  = ThiVC();
///代码块调用
vc.thiBlock = {(str) -> () in
print("代码块方法");
}

self.present(vc, animated: true, completion: {

});
```
![提示][3]

###6、oc对swift的属性传值、方法调用、代码块调用

- swift方法类
```swift
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

```


- oc方法类：
```oc
FourVC *vc = [FourVC new];
// --- 属性传值 ---
vc.arr0 = @[@"可以",@"可以",@"可以"];

/// ------ 方法调用 -----

//无参数无返回值
[vc swMethod0];
//有参数无返回值
[vc swMethod1WithStr:@"dasda"];
//有参数有返回值
NSString *str = [vc swMethod2WithStr:@"sdfasda"];
NSLog(@"%@",str);

/// ------ 代码块调用 -----

[vc bkBlock0WithResponse:^{
NSLog(@"无返回数据代码块");
}];

//有一个返回值
[vc bkBlock1WithResponse:^(NSString * str) {
NSLog(@"%@", str);
}];

//有两个返回值
[vc bkBlock_2_WithResponse:^(id str, id str1) {
NSLog(@"%@\n%@",str1,str);
}];

//有参数有返回值
[vc bkBlock3WithP1:@"ds" p2:@"dsa" p3:@"das" res:^(id p0,id p1, id p2, id p3) {
NSLog(@"%@\n%@\n%@\n%@",p0,p1,p2,p3);
}];

[self presentViewController:vc animated:YES completion:^{

}];

```
![此处输入图片的描述][4]

###7、swift对oc的属性传值、方法调用、代码块调用

- xxx.h文件
```oc
@interface OcVC : UIViewController
///代码块
@property(nonatomic,strong)void (^clickBlock)(void);
///字符串
@property(nonatomic,copy)NSString *titStr;
///方法
-(void)testAction;
@end

```
- xxx.m文件
```oc
- (void)viewDidLoad {
[super viewDidLoad];
NSLog(@"%@",self.titStr);
!self.clickBlock?:self.clickBlock();
}

-(void)testAction{
NSLog(@"调用方法");
}

```

- xxx.swift文件

```oc

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
```
![打印结果][5]

###8、swift之间的传值
```swift
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
```


[1]: https://gitee.com/chenzm_186/OCBridgeSwiftToCall/raw/master/DemoSwift/Images/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-08%20%E4%B8%8B%E5%8D%884.42.53.png
[2]: https://gitee.com/chenzm_186/OCBridgeSwiftToCall/raw/master/DemoSwift/Images/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-08%20%E4%B8%8B%E5%8D%884.49.56.png
[3]: https://gitee.com/chenzm_186/OCBridgeSwiftToCall/raw/master/DemoSwift/Images/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-08%20%E4%B8%8B%E5%8D%884.58.58.png
[4]: https://gitee.com/chenzm_186/OCBridgeSwiftToCall/raw/master/DemoSwift/Images/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-08%20%E4%B8%8B%E5%8D%885.40.49.png
[5]: https://gitee.com/chenzm_186/OCBridgeSwiftToCall/raw/master/DemoSwift/Images/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202018-08-08%20%E4%B8%8B%E5%8D%885.51.17.png

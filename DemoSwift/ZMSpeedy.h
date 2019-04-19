//
//  ZMSpeedy.h
//  DDTL
//
//  Created by lx on 2017/8/7.
//  Copyright © 2017年 lx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



//动画格式
//涟漪
static NSString *zm_animat_type_rippleEffect = @"rippleEffect";
//淡出
static NSString *zm_animat_type_fade = @"fade";
//移入
static NSString *zm_animat_type_moveIn = @"moveIn";
//推进
static NSString *zm_animat_type_push = @"push";
//揭开
static NSString *zm_animat_type_reveal = @"reveal";
//立体旋转
static NSString *zm_animat_type_cube = @"cube";
//上下翻转效果
static NSString *zm_animat_type_oglFlip = @"oglFlip";
//收缩效果，如一块布被抽走
static NSString *zm_animat_type_suckEffect = @"suckEffect";


//动画方向
static NSString *zm_animat_subtype_fLeft = @"fromLeft";
static NSString *zm_animat_subtype_fRight = @"fromRight";
static NSString *zm_animat_subtype_fTop = @"fromTop";
static NSString *zm_animat_subtype_fBottom = @"fromBottom";

@interface ZMSpeedy : NSObject


/**
 设置按钮的圆角与边框
 
 @param anyControl 控件
 @param radius 圆角度
 @param width 边宽度
 @param borderColor 边线颜色
 @param can 是否裁剪
 @return 控件
 */
+(id)zm_setRoundedWithControl:(id)anyControl cornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)borderColor canMasksToBounds:(BOOL)can;

/**
 环形布局控件
 @param interval 布局区间大小
 @param center 布局的中心点
 @param radius 半径
 @param count 布局的个数
 @param stIndex 起点角度
 @param index 第几个
 */
+ (CGPoint)zm_circularLayoutWithInterval:(CGFloat)interval center:(CGPoint)center radius:(CGFloat)radius count:(NSUInteger)count stIndex:(CGFloat)stIndex index:(NSUInteger)index;

/**
 贝塞尔曲线设置圆角【UIRectCornerTopLeft、Right】
 
 @param layer 图层
 @param corners 圆角位置
 @param size 圆角尺寸
 */
+ (void)zm_setBezierPathRoundedWithLayer:(CALayer *)layer rectCorners:(UIRectCorner)corners cornerRadii:(CGSize)size;

/**
 设置控件的阴影
 
 @param layer        控件Layer图层
 @param shadowColor 阴影颜色
 @param shadowOffset  阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
 @param shadowRadius 阴影半径
 @param shadowOpacity  阴影透明度，默认0
 */
+(void)zm_setViewShadow:(CALayer *)layer color:(UIColor *)color offset:(CGSize )offset radius:(CGFloat )radius opacity:(CGFloat)opacity;
/**
 设置控件的边框【圆角、颜色】
 
 @param layer        控件Layer图层
 @param cornerRadius 圆角大小
 @param borderColor  边框颜色
 @param borderWidth  边框宽度
 */
+(void)zm_setViewBorders:(CALayer *)layer cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
/**
 改变lbl控件字符串部分颜色或字体大小（label）
 
 @param label label
 @param array 将要改变的字符串数组
 @param color 改变后的颜色
 @param font  改变后的字体
 @return label
 */
+(id)zm_changeSomeStrAttriWithLbl:(UILabel *)label selectArray:(NSArray *)array changeColor:(UIColor *)color changeFont:(UIFont *)font;

/**
 上划线添加设置
 
 @param view 添加到的视图
 @param color 下划线颜色
 @param height 下划线高度
 @param mar_left 左边间距
 @param mar_rig 右边间距
 */
+ (void)zm_setOverlineWith:(UIView *)view color:(UIColor *)color height:(CGFloat)height mar_left:(CGFloat)mar_left mar_rig:(CGFloat)mar_rig;

/**
 横线视图添加
 
 @param view 添加到的视图
 @param color 下划线颜色
 @param height 下划线高度
 @param mar_left 左边间距
 @param mar_rig 右边间距
 @param lineType 线条类型 1、顶线  2、底线
 */
+ (void)zm_setHorizontalLineWith:(UIView *)view color:(UIColor *)color height:(CGFloat)height mar_left:(CGFloat)mar_left mar_rig:(CGFloat)mar_rig lineType:(NSInteger)lineType;
/**
 横线图标添加
 @param view 添加到的视图
 @param mar_left 左边间距
 @param mar_rig 右边间距
 @param lineType 线条类型 1、底线    其它、顶线
 */
+ (void)zm_setLineImgV:(UIView *)view mar_left:(CGFloat)mar_left mar_rig:(CGFloat)mar_rig img:(UIImage *)img lineType:(NSInteger)lineType;

/**
 label首行缩进
 
 @param label label
 @param content 文本内容
 @param emptylen 缩进比
 */
+ (void)zm_setUpLabel:(UILabel *)label content:(NSString *)content theFirstIndentationLength:(CGFloat)emptylen;

/**
 字符串加星处理
 
 @param content 要加密的字符串
 @param findex 要加密的起始位置
 @return 加密后的字符串
 */
+ (NSString *)zm_encryptionMessage:(NSString *)content firstIndex:(NSInteger)findex;

#pragma mark - UIImage
/**
 图片转base64编码

 @param image 图片
 @return 转base64编码
 */
+(NSString *)zm_UIImageToBase64Str:(UIImage *) image;

/**
 base64编码转图片

 @param encodedImageStr base64图片编码
 @return 图片
 */
+(UIImage *)zm_Base64StrToUIImage:(NSString *)encodedImageStr;

/**
 图片拉伸处理
 @param image 要拉伸的图片
 @param mode 拉伸默认
 */
+(UIImage *)zm_resizableImage:(UIImage *)image resizingMode:(UIImageResizingMode)mode;

#pragma mark -
#pragma mark - CAKeyframeAnimation动画
/**
 点击缩放动画
 @return 返回动画
 */
+(CAKeyframeAnimation *)zm_animationWithTabClickByScale;

/**
 点击动画效果
 @pragram layer: 对象
 @pragram type:【格式】 rippleEffect(涟漪)，fade（淡出）,moveIn（移入）,push（推进），reveal（揭开）,cube(立体旋转)
 @pragram subType:【动画方向】fromLeft,fromRight,fromTop，fromBottom
 @pragram duration:持续时间[<0取默认时间1秒]
 @pragram key: 键值
 @return 返回动画
 */
+(void)zm_animationWithView:(CALayer *)layer
                       type:(NSString *)type subType:(NSString *)subType duraton:(CFTimeInterval)duration key:(NSString *)key;
///添加视图动画【慢慢放大】
+(void)zm_showViewByAnimationWithLayer:(CALayer *)layer duraton:(CFTimeInterval)duration;
///添加视图动画【慢慢最大 缩小 还原】
+(void)zm_showViewByAnimation_BMR_WithLayer:(CALayer *)layer duraton:(CFTimeInterval)duration;
///添加视图动画【自定义】
+(void)zm_showAnimationWithLayer:(CALayer *)layer duraton:(CFTimeInterval)duration scaleA:(CGFloat)scaleA scaleB:(CGFloat)scaleB;
///移除页面的动画【慢慢淡出】
+(void)zm_removeViewByAnimationWithView:(UIView *)view duraton:(CFTimeInterval)duration;

#pragma mark -
#pragma mark - 富文本
///设置富文本
+(NSMutableAttributedString *)zm_richText_text:(NSString *)Str color:(UIColor *)color range:(NSRange)range font:(UIFont *)font;
/**
 富文本 【图文】
 
 @param str 字符串
 @param image 图标
 @param color 字体颜色
 @param font 字体大小
 @param position 图标的位置 1、图标在文本前面 2、图标在文本后面
 */
+(NSMutableAttributedString *)zm_richImgText_text:(NSString *)str image:(UIImage *)image textColor:(UIColor *)color font:(UIFont *)font imgPosition:(NSUInteger)position;



#pragma mark -
#pragma mar - 有关时间的判断

/**
 对比两个时间是否为同一天
 @param date1 第一个时间戳
 @param date2 第二个时间戳
 */
+ (BOOL)zm_isSameDay:(NSDate*)date1 date2:(NSDate*)date2;


#pragma mark - 单元格刷新
//刷新某个单元格
+(void)zm_refreshCellWithRow:(NSInteger)row section:(NSInteger)section view:(id)view;
//刷新某组单元格
+(void)zm_refreshCellWithSection:(NSInteger)section view:(id)view;
#pragma mark - 判断
///如果想要判断设备是ipad，要用如下方法
+(BOOL)zm_JudgeIsIpad;


///渐变透明度
+(void)zm_changeAlpha:(UIView *)alView;
+(void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;
@end

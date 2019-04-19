//
//  ZMSpeedy.m
//  DDTL
//
//  Created by lx on 2017/8/7.
//  Copyright © 2017年 lx. All rights reserved.
//

#import "ZMSpeedy.h"

@implementation ZMSpeedy

/**
 设置按钮的圆角与边框
 
 @param anyControl 控件
 @param radius 圆角度
 @param width 边宽度
 @param borderColor 边线颜色
 @param can 是否裁剪
 @return 控件
 */
+(id)zm_setRoundedWithControl:(id)anyControl cornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)borderColor canMasksToBounds:(BOOL)can{
    
    CALayer *icon_layer=[anyControl layer];
    [icon_layer setCornerRadius:radius];
    [icon_layer setBorderWidth:width];
    [icon_layer setBorderColor:[borderColor CGColor]?:[UIColor clearColor].CGColor];
    [icon_layer setMasksToBounds:can];
    return anyControl;
}

/**
 环形布局控件
 @param interval 布局区间大小
 @param center 布局的中心点
 @param radius 半径
 @param count 布局的个数
 @param stIndex 起点角度
 @param index 第几个
 */
+(CGPoint)zm_circularLayoutWithInterval:(CGFloat)interval center:(CGPoint)center radius:(CGFloat)radius count:(NSUInteger)count stIndex:(CGFloat)stIndex index:(NSUInteger)index{
    //度数
    float angle_degrees = stIndex + (interval / (count + 1)) * (index + 1);
    //弧度
    float angle_Radians = (angle_degrees) / 180.0 * M_PI;
    //计算值
    float y = sin(angle_Radians) * radius;
    float x = cos(angle_Radians) * radius;
    CGPoint center_trans = CGPointMake(center.x + x,center.y + y);
    return center_trans;
}

/**
 贝塞尔曲线设置圆角【UIRectCornerTopLeft、Right】
 
 @param layer 图层
 @param corners 圆角位置
 @param size 圆角尺寸
 */
+ (void)zm_setBezierPathRoundedWithLayer:(CALayer *)layer rectCorners:(UIRectCorner)corners cornerRadii:(CGSize)size{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:layer.bounds byRoundingCorners:corners cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = layer.bounds;
    maskLayer.path = maskPath.CGPath;
    layer.mask = maskLayer;
}


/**
 设置控件的阴影
 
 @param layer        控件Layer图层
 @param shadowColor 阴影颜色
 @param shadowOffset  阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
  @param shadowRadius 阴影半径
 @param shadowOpacity  阴影透明度，默认0
 */
+(void)zm_setViewShadow:(CALayer *)layer color:(UIColor *)color offset:(CGSize )offset radius:(CGFloat )radius opacity:(CGFloat)opacity{
    layer.shadowColor = color.CGColor;
    layer.shadowOffset = offset;
    layer.shadowRadius = radius;
    layer.shadowOpacity = opacity;
}
/**
 设置控件的边框【圆角、颜色】
 
 @param layer        控件Layer图层
 @param cornerRadius 圆角大小
 @param borderColor  边框颜色
 @param borderWidth  边框宽度
 */
+(void)zm_setViewBorders:(CALayer *)layer cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    if (borderWidth)
    {
        layer.borderWidth = borderWidth;
    }
    if (borderColor)
    {
        layer.borderColor = borderColor.CGColor;
    }
    if (cornerRadius)
    {
        layer.cornerRadius = cornerRadius;
        layer.masksToBounds = YES;
    }
}


/**
 改变控件字符串部分颜色或字体大小（label）
 
 @param label label
 @param array 将要改变的字符串数组
 @param color 改变后的颜色
 @param font  改变后的字体
 @return label
 */
+(id)zm_changeSomeStrAttriWithLbl:(UILabel *)label selectArray:(NSArray *)array changeColor:(UIColor *)color changeFont:(UIFont *)font{
    if (label.text.length == 0) {
        return 0;
    }
    int i;
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:label.text];
    for (i = 0; i < label.text.length; i ++) {
        NSString *a = [label.text substringWithRange:NSMakeRange(i, 1)];
        NSArray *number = array;
        if ([number containsObject:a]) {
            if (color) {
                [attributeString setAttributes:@{NSForegroundColorAttributeName:color} range:NSMakeRange(i, 1)];
            }
            if (font) {
                [attributeString setAttributes:@{NSFontAttributeName:font} range:NSMakeRange(i, 1)];
            }

        }
    }
    label.attributedText = attributeString;
    return label;
}



/**
 label首行缩进
 
 @param label label
 @param content 文本内容
 @param emptylen 缩进比
 */
+ (void)zm_setUpLabel:(UILabel *)label content:(NSString *)content theFirstIndentationLength:(CGFloat)emptylen{
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.firstLineHeadIndent = emptylen;//首行缩进
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:content attributes:@{NSParagraphStyleAttributeName:paraStyle01}];
    label.attributedText = attrText;
}



/**
 字符串加星处理

 @param content 要加密的字符串
 @param findex 要加密的起始位置
 @return 加密后的字符串
 */
+ (NSString *)zm_encryptionMessage:(NSString *)content firstIndex:(NSInteger)findex{
    if (findex <= 0) {
        findex = 2;
    }else if (findex + 1 > content.length) {
        findex --;
    }
    return [NSString stringWithFormat:@"%@***%@",[content substringToIndex:findex],[content substringFromIndex:content.length - 1]];
}

/**
 图片转base64编码
 
 @param image 图片
 @return 转base64编码
 */
+(NSString *)zm_UIImageToBase64Str:(UIImage *) image{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

//base64图片转编码
+(UIImage *)zm_Base64StrToUIImage:(NSString *)encodedImageStr{
    NSData *decodedImageData = [[NSData alloc] initWithBase64EncodedString:encodedImageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
    return decodedImage;
}


/**
 图片拉伸处理
 @param image 要拉伸的图片
 @param mode 拉伸默认
 */
+(UIImage *)zm_resizableImage:(UIImage *)image resizingMode:(UIImageResizingMode)mode{
    // 设置端盖的值
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;
    CGFloat bottom = image.size.height * 0.5;
    CGFloat right = image.size.width * 0.5;
    
    // 设置端盖的值
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    // 设置拉伸的模式
    // 拉伸图片
    UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets resizingMode:mode];
    return newImage;
}


#pragma mark - 
#pragma mark - CAKeyframeAnimation动画

/**
 点击缩放动画
 @return 返回动画
 */
+(CAKeyframeAnimation *)zm_animationWithTabClickByScale{
    //需要实现的帧动画,这里根据自己需求改动
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.2,@0.8,@1.0];
    animation.duration = 0.3;
    animation.calculationMode = kCAAnimationCubic;
    return animation;
}

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
                       type:(NSString *)type subType:(NSString *)subType duraton:(CFTimeInterval)duration key:(NSString *)key{
    //kCATransitionFromLeft
    CATransition *transition = [CATransition animation];
    //设置动画的持续时间
    duration = duration<0?1:duration;
    [transition setDuration:duration];
    ///动画类型
    [transition setType:type];
    ///动画方向
    [transition setSubtype:subType];
    //动画开始和结束时间的快慢
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    //动画的key
    key = key?key:@"";
    [layer addAnimation:transition forKey:key];
}

///添加视图动画【慢慢放大】
+(void)zm_showViewByAnimationWithLayer:(CALayer *)layer duraton:(CFTimeInterval)duration{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    if (duration == 0) {
        animation.duration = 0.3;
    }else{
        animation.duration = duration;
    }
    
    NSMutableArray *values = [NSMutableArray array];
    
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(0.75, 0.75, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [layer addAnimation:animation forKey:nil];
}

///添加视图动画【慢慢最大 缩小 还原】
+(void)zm_showViewByAnimation_BMR_WithLayer:(CALayer *)layer duraton:(CFTimeInterval)duration{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    if (duration == 0) {
        animation.duration = 0.3;
    }else{
        animation.duration = duration;
    }
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(0.85, 0.85, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [layer addAnimation:animation forKey:nil];
}

///添加视图动画【自定义】
+(void)zm_showAnimationWithLayer:(CALayer *)layer duraton:(CFTimeInterval)duration scaleA:(CGFloat)scaleA scaleB:(CGFloat)scaleB{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    if (duration == 0) {
        animation.duration = 0.3;
    }else{
        animation.duration = duration;
    }
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(scaleA, scaleA, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(scaleB, scaleB, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [layer addAnimation:animation forKey:nil];

}
///移除页面的动画
+(void)zm_removeViewByAnimationWithView:(UIView *)view duraton:(CFTimeInterval)duration{
    [UIView animateWithDuration:duration
                     animations:^{
                         view.alpha = 0;
                         [view layoutSubviews];
                     } completion:^(BOOL finished) {
                         view.alpha = 1;
                         [view removeFromSuperview];
                     }];
}


#pragma mark -
#pragma mark - 富文本

/**
 富文本 【文本】
 @param text 字符串
 @return 属性文本
 */
+(NSMutableAttributedString *)zm_richText_text:(NSString *)text{
    return [[NSMutableAttributedString alloc] initWithString:text attributes:nil];
}



#pragma mark -
#pragma mar - 有关时间的判断

/**
 对比两个时间是否为同一天
 @param date1 第一个时间戳
 @param date2 第二个时间戳
 */
+ (BOOL)zm_isSameDay:(NSDate*)date1 date2:(NSDate*)date2{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

//刷新某个单元格
+(void)zm_refreshCellWithRow:(NSInteger)row section:(NSInteger)section view:(id)view{
    
    if ([view isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)view;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
        [collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil]];
    }

    if ([view isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)view;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }
}

//刷新某组单元格
+(void)zm_refreshCellWithSection:(NSInteger)section view:(id)view {
    
    if ([view isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)view;
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:section];
        [collectionView reloadSections:indexSet];
    }
    
    if ([view isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)view;
        //一个section刷新
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:section];
        [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

///如果想要判断设备是ipad，要用如下方法
+(BOOL)zm_JudgeIsIpad{
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType isEqualToString:@"iPhone"]) {
        //iPhone
        return NO;
    }else if([deviceType isEqualToString:@"iPod touch"]) {
        //iPod Touch
        return NO;
    }else if([deviceType isEqualToString:@"iPad"]) {
        //iPad
        return YES;
    }
    return NO;
}


///渐变透明度
+(void)zm_changeAlpha:(UIView *)alView{
    CAGradientLayer *_gradLayer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0.9] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0.95] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                       nil];
    [_gradLayer setColors:colors];
    //渐变起止点，point表示向量
    [_gradLayer setStartPoint:CGPointMake(0.0f, 0.0f)];
    [_gradLayer setEndPoint:CGPointMake(0.0f, 1.0f)];
    [_gradLayer setFrame:alView.bounds];
    [alView.layer setMask:_gradLayer];
}

@end

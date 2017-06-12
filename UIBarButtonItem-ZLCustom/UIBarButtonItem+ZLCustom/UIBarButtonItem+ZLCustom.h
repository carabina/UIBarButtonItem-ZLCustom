//
//  UIBarButtonItem+ZLCustom.h
//  BasicProduct
//
//  Created by zhaolei on 2017/6/12.
//  Copyright © 2017年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZLCustom)

/**生产出一个UIBarButtonItem对象
 *@param imageColor 将来的图片颜色
 *@param textColor 将来的文字颜色
 *@param target 事件监听者
 *@param action 被执行的方法
 *@param alignment 内容的对齐方式
 *@param imageName 本地图片名称
 *@param text 标题文字
 *@param block 其他事件操作（按钮的显示和隐藏）
 */
+(instancetype)barButtonItemWithImageColor:(UIColor *)imageColor TextColor:(UIColor *)textColor Target:(id)target Action:(SEL)action ContentHorizontalAlignment:(UIControlContentHorizontalAlignment)alignment ImageName:(NSString*)imageName Text:(NSString *)text OtherAction:(void (^)(UIButton *barButton))block;

@end

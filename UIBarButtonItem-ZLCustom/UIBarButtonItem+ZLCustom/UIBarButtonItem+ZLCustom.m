//
//  UIBarButtonItem+ZLCustom.m
//  BasicProduct
//
//  Created by zhaolei on 2017/6/12.
//  Copyright © 2017年 赵磊. All rights reserved.
//

#import "UIBarButtonItem+ZLCustom.h"

@interface UIImage (ChangeColor)

/**改变图片的显示颜色
 *@param color 将要显示的颜色
 */
- (UIImage *)changeImageColorWithColor:(UIColor *)color;

@end

@implementation UIImage (ChangeColor)

/**改变图片的显示颜色
 *@param color 将要显示的颜色
 */
- (UIImage *)changeImageColorWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

@implementation UIBarButtonItem (ZLCustom)

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
+(instancetype)barButtonItemWithImageColor:(UIColor *)imageColor TextColor:(UIColor *)textColor Target:(id)target Action:(SEL)action ContentHorizontalAlignment:(UIControlContentHorizontalAlignment)alignment ImageName:(NSString*)imageName Text:(NSString *)text OtherAction:(void (^)(UIButton *barButton))block {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 75, 40)];
    UIImage *image = nil;
    if (imageName) {
        image = [UIImage imageNamed:imageName];
    }
    if (imageColor) {
        image = [image changeImageColorWithColor:imageColor];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.contentHorizontalAlignment = alignment;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
    if (text) {
        [button setTitle:text forState:UIControlStateNormal];
    }
    if (textColor) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    if (block) {
        block(button);
    }
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end

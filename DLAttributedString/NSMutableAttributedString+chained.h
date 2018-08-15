//
//  NSMutableAttributedString+chained.h
//  DLAttributedString_Demo
//
//  https://github.com/dlwj15/DLAttributedString
//  Created by 冯文杰 on 2018/8/15.
//  Copyright © 2018年 冯文杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NSMutableAttributedString *(^DLAttributedAppend)(NSString *string, void(^block)(NSMutableAttributedString *make));
#define DLAttributedAppend(string, block) ^NSMutableAttributedString * (NSString *string, void(^block)(NSMutableAttributedString *make))

typedef NSMutableAttributedString *(^DLAttributedTextEffect)(void);
#define DLAttributedTextEffect() ^NSMutableAttributedString * ()

typedef NSMutableAttributedString *(^DLAttributedColor)(UIColor *color);
#define DLAttributedColor(color) ^NSMutableAttributedString * (UIColor *color)

typedef NSMutableAttributedString *(^DLAttributedLink)(NSString *str);
#define DLAttributedLink(s) ^NSMutableAttributedString * (NSString *s)

typedef NSMutableAttributedString *(^DLAttributedLine)(NSUnderlineStyle style, UIColor *color);
#define DLAttributedLine(s, c) ^NSMutableAttributedString * (NSUnderlineStyle s, UIColor *c)

typedef NSMutableAttributedString *(^DLAttributedFloat)(CGFloat f);
#define DLAttributedFloat(f) ^NSMutableAttributedString * (CGFloat f)

typedef NSMutableAttributedString *(^DLAttributedCustomFont)(NSString *s, CGFloat f);
#define DLAttributedCustomFont(s, f) ^NSMutableAttributedString * (NSString *s, CGFloat f)

typedef NSMutableAttributedString *(^DLAttributedStroke)(UIColor *color, CGFloat f);
#define DLAttributedStroke(color, f) ^NSMutableAttributedString * (UIColor *color, CGFloat f)

typedef NSMutableAttributedString *(^DLAttributedAttachment)(void (^block)(NSTextAttachment *textAttachment));
#define DLAttributedAttachment(block) ^NSMutableAttributedString * (void (^block)(NSTextAttachment *textAttachment))

typedef NSMutableAttributedString *(^DLAttributedShadow)(CGFloat blurRadius, UIColor *color, CGSize offset);
#define DLAttributedShadow(blurRadius, color, offset) ^NSMutableAttributedString * (CGFloat blurRadius, UIColor *color, CGSize offset)

typedef NSMutableAttributedString *(^DLAttributedParagraphStyle)(CGFloat lineSpacing, NSTextAlignment alignment, void (^block)(NSMutableParagraphStyle *paragraphStyle));
#define DLAttributedParagraphStyle(lineSpacing, alignment, block) ^NSMutableAttributedString * (CGFloat lineSpacing, NSTextAlignment alignment, void (^block)(NSMutableParagraphStyle *paragraphStyle))

typedef NSMutableAttributedString *(^DLAttributedDirection)(NSInteger direction);
#define DLAttributedDirection(direction) ^NSMutableAttributedString * (NSInteger direction)

@interface NSMutableAttributedString (chained)

/**
 拼接字符串
 */
@property (nonatomic, copy, readonly) DLAttributedAppend append;

/**
 文字颜色
 */
@property (nonatomic, copy, readonly) DLAttributedColor color;

/**
 背景颜色
 */
@property (nonatomic, copy, readonly) DLAttributedColor bgColor;

/**
 下划线 使用下边类型组合使用产生虚线
 
 NSUnderlineStyle
 
 NSUnderlinePattern
 */
@property (nonatomic, copy, readonly) DLAttributedLine underLine;

/**
 中划线 使用下边类型组合使用产生虚线
 
 NSUnderlineStyle
 
 NSUnderlinePattern
 */
@property (nonatomic, copy, readonly) DLAttributedLine strikethrough;

/**
 字体大小
 */
@property (nonatomic, copy, readonly) DLAttributedFloat font;

/**
 加粗字体大小
 */
@property (nonatomic, copy, readonly) DLAttributedFloat bFont;

/**
 自定义字体
 */
@property (nonatomic, copy, readonly) DLAttributedCustomFont customFont;

/**
 空心字
 
 设置笔画的宽度，取值为NSNumber对象（整数），负值填充效果，正值是中空效果
 
 color 填充部分颜色
 
 f 描边宽度
 */
@property (nonatomic, copy, readonly) DLAttributedStroke stroke;

/**
 文字间距
 */
@property (nonatomic, copy, readonly) DLAttributedFloat kern;

/**
 倾斜
 
 正值右倾
 
 负值左倾
 */
@property (nonatomic, copy, readonly) DLAttributedFloat obliqueness;

/**
 拉伸
 
 正值横向拉伸文本
 
 负值横向压缩文本
 */
@property (nonatomic, copy, readonly) DLAttributedFloat expansion;

/**
 基线偏移量
 
 正值上偏 负值下偏
 */
@property (nonatomic, copy, readonly) DLAttributedFloat baselineOffset;

/**
 特殊效果，自行挖掘
 */
@property (nonatomic, copy, readonly) DLAttributedTextEffect textEffect;

/**
 网址
 */
@property (nonatomic, copy, readonly) DLAttributedLink link;

/**
 shadow
 
 blurRadius 阴影的模糊程度
 
 color 阴影颜色
 
 offset 阴影相对原来的偏移
 */
@property (nonatomic, copy, readonly) DLAttributedShadow shadow;

/**
 图文混排
 
 block：需要设置图片和图片大小
 */
@property (nonatomic, copy, readonly) DLAttributedAttachment attachment;

/**
 段落设置
 */
@property (nonatomic, copy, readonly) DLAttributedParagraphStyle paragraphStyle;

/**
 书写方向
 
 0 @[@(NSWritingDirectionLeftToRight | NSWritingDirectionEmbedding)]
 1 @[@(NSWritingDirectionLeftToRight | NSWritingDirectionOverride)]
 2@[@(NSWritingDirectionRightToLeft | NSWritingDirectionEmbedding)]
 3@[@(NSWritingDirectionRightToLeft | NSWritingDirectionOverride)]
 */
@property (nonatomic, copy, readonly) DLAttributedDirection writingDirection;

+ (instancetype)attributed;
+ (instancetype)attributedWithString:(NSString *)string;
+ (instancetype)attributedWithString:(NSString *)string andAttributedDict:(NSDictionary<NSAttributedStringKey, id> *)attributedDict;

@end


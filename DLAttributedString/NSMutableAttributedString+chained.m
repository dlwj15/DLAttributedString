//
//  NSMutableAttributedString+chained.m
//  DLAttributedString_Demo
//
//  https://github.com/dlwj15/DLAttributedString
//  Created by 冯文杰 on 2018/8/15.
//  Copyright © 2018年 冯文杰. All rights reserved.
//

#import "NSMutableAttributedString+chained.h"
#import <objc/runtime.h>

@implementation NSMutableAttributedString (chained)

+ (instancetype)attributed {
    return [self attributedWithString:@""];
}

+ (instancetype)attributedWithString:(NSString *)string {
    return [self attributedWithString:string andAttributedDict:nil];
}

+ (instancetype)attributedWithString:(NSString *)string andAttributedDict:(NSDictionary<NSAttributedStringKey,id> *)attributedDict {
    return [[NSMutableAttributedString alloc] initWithString:string attributes:attributedDict];
}

- (DLAttributedAppend)append {
    DLAttributedAppend Attributed = DLAttributedAppend(string, block) {
        NSMutableAttributedString *make = [[NSMutableAttributedString alloc] initWithString:string];
        if (block) {
            block(make);
        }
        [self appendAttributedString:make];
        return self;
    };
    return Attributed;
}

- (DLAttributedColor)color {
    DLAttributedColor Attributed = DLAttributedColor(color) {
        [self addAttribute:NSForegroundColorAttributeName
                     value:color
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedColor)bgColor {
    DLAttributedColor Attributed = DLAttributedColor(color) {
        [self addAttribute:NSBackgroundColorAttributeName
                     value:color
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedLine)underLine {
    DLAttributedLine Attributed = DLAttributedLine(s, c) {
        [self addAttribute:NSUnderlineStyleAttributeName
                     value:@(s)
                     range:self.changeRange];
        [self addAttribute:NSUnderlineColorAttributeName
                     value:c
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedLine)strikethrough {
    DLAttributedLine Attributed = DLAttributedLine(s, c) {
        [self addAttribute:NSStrikethroughStyleAttributeName
                     value:@(s)
                     range:self.changeRange];
        [self addAttribute:NSStrikethroughColorAttributeName
                     value:c
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedFloat)font {
    DLAttributedFloat Attributed = DLAttributedFloat(f) {
        [self addAttribute:NSFontAttributeName
                     value:[UIFont systemFontOfSize:f]
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedFloat)bFont {
    DLAttributedFloat Attributed = DLAttributedFloat(f) {
        [self addAttribute:NSFontAttributeName
                     value:[UIFont boldSystemFontOfSize:f]
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedCustomFont)customFont {
    DLAttributedCustomFont Attributed = DLAttributedCustomFont(s, f) {
        [self addAttribute:NSFontAttributeName
                     value:[UIFont fontWithName:s size:f]
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedStroke)stroke {
    DLAttributedStroke Attributed = DLAttributedStroke(color, f) {
        [self addAttribute:NSStrokeColorAttributeName
                     value:color
                     range:self.changeRange];
        [self addAttribute:NSStrokeWidthAttributeName
                     value:@(f)
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedFloat)kern {
    DLAttributedFloat Attributed = DLAttributedFloat(f) {
        [self addAttribute:NSKernAttributeName
                     value:@(f)
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedFloat)obliqueness {
    DLAttributedFloat Attributed = DLAttributedFloat(f) {
        [self addAttribute:NSObliquenessAttributeName
                     value:@(f)
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedFloat)expansion {
    DLAttributedFloat Attributed = DLAttributedFloat(f) {
        [self addAttribute:NSExpansionAttributeName
                     value:@(f)
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedFloat)baselineOffset {
    DLAttributedFloat Attributed = DLAttributedFloat(f) {
        [self addAttribute:NSBaselineOffsetAttributeName
                     value:@(f)
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedNormal)textEffect {
    DLAttributedNormal Attributed = DLAttributedNormal() {
        // NSString类型 目前只有NSTextEffectLetterpressStyle(凸版印刷效果)可用
        [self addAttribute:NSTextEffectAttributeName
                     value:NSTextEffectLetterpressStyle
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedLink)link {
    DLAttributedLink Attributed = DLAttributedLink(s) {
        NSRange range = [self.string rangeOfString:s];
        if (range.location != NSNotFound) {
            [self addAttribute:NSLinkAttributeName
                         value:[NSURL URLWithString:s]
                         range:range];
        }
        return self;
    };
    return Attributed;
}

- (DLAttributedShadow)shadow {
    DLAttributedShadow Attributed = DLAttributedShadow(blurRadius, color, offset) {
        NSShadow *shadow=[[NSShadow alloc]init];
        shadow.shadowBlurRadius = blurRadius;//阴影的模糊程度
        shadow.shadowColor = color;//阴影颜色
        shadow.shadowOffset = offset;//阴影相对原来的偏移
        [self addAttribute:NSShadowAttributeName
                     value:shadow
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedAttachment)attachment {
    DLAttributedAttachment Attributed = DLAttributedAttachment(block) {
        if (block) {
            NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
            block(textAttachment);
            NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
            [self appendAttributedString:attachmentAttrStr];
        }
        return self;
    };
    return Attributed;
}

- (DLAttributedParagraphStyle)paragraphStyle {
    DLAttributedParagraphStyle Attributed = DLAttributedParagraphStyle(lineSpacing, alignment, block) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        // 行间距
        paragraphStyle.lineSpacing = lineSpacing;
        // 对齐方式
        paragraphStyle.alignment = alignment;
        
        if (block) {
            block(paragraphStyle);
        }
        [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedDirection)writingDirection {
    DLAttributedDirection Attributed = DLAttributedDirection(direction) {
        NSArray *directionArr;
        if (@available(iOS 9.0, *)) {
            switch (direction) {
                case 0:
                    directionArr = @[@(NSWritingDirectionLeftToRight | NSWritingDirectionEmbedding)];
                    break;
                case 1:
                    directionArr = @[@(NSWritingDirectionLeftToRight | NSWritingDirectionOverride)];
                    break;
                case 2:
                    directionArr = @[@(NSWritingDirectionRightToLeft | NSWritingDirectionEmbedding)];
                    break;
                case 3:
                    directionArr = @[@(NSWritingDirectionRightToLeft | NSWritingDirectionOverride)];
                    break;
                default:
                    break;
            }
        } else {
            switch (direction) {
                case 0:
                    directionArr = @[@(NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding)];
                    break;
                case 1:
                    directionArr = @[@(NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride)];
                    break;
                case 2:
                    directionArr = @[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding)];
                    break;
                case 3:
                    directionArr = @[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride)];
                    break;
                default:
                    break;
            }
        }
        
        [self addAttribute:NSWritingDirectionAttributeName
                     value:directionArr
                     range:self.changeRange];
        return self;
    };
    return Attributed;
}

- (DLAttributedRange)beginRange {
    DLAttributedRange attributed = DLAttributedRange(range) {
        objc_setAssociatedObject(self, @selector(changeRange), NSStringFromRange(range), OBJC_ASSOCIATION_COPY_NONATOMIC);
        return self;
    };
    return attributed;
}

- (DLAttributedNormal)endRange {
    DLAttributedNormal attributed = DLAttributedNormal() {
        objc_setAssociatedObject(self, @selector(changeRange), NSStringFromRange(NSMakeRange(0, 0)), OBJC_ASSOCIATION_COPY_NONATOMIC);
        return self;
    };
    return attributed;
}

- (NSRange)changeRange {
    NSRange range = NSRangeFromString(objc_getAssociatedObject(self, _cmd));
    BOOL beyond = NSMaxRange(range) > self.length;
    if (beyond) {
        NSString *str = [NSString stringWithFormat:@"%s: range:%@ beyond string:\"%@\" for range:%@", __FUNCTION__, NSStringFromRange(range), self.string, NSStringFromRange(NSMakeRange(0, self.length))];
        NSAssert(!beyond, str);
    }
    if (!NSEqualRanges(range, NSMakeRange(0, 0))) {
        return range;
    }
    return NSMakeRange(0, self.length);
}

@end

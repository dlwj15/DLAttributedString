//
//  ViewController.m
//  DLAttributedString_Demo
//
//  Created by 冯文杰 on 2018/8/15.
//  Copyright © 2018年 冯文杰. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableAttributedString+chained.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *attributedLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO: 设置字体颜色和字体背景色
- (IBAction)onClickCharacterColor:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.color(UIColor.redColor)
    .bgColor(UIColor.yellowColor)
    .beginRange(NSMakeRange(2, 2))
    .color(UIColor.greenColor)
    .append(@"中国好声音", ^(NSMutableAttributedString *make) {
        make.beginRange(NSMakeRange(2, 3))
        .color(UIColor.blueColor)
        .bgColor(UIColor.whiteColor);
        make.endRange();
        make.bFont(25);
    });
//    attributedStr.endRange();
    attributedStr.bFont(25);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 设置字体font
- (IBAction)onClickCharacterFont:(id)sender {
    int font = arc4random() % 10 + 20;
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.color(UIColor.redColor)
    .bgColor(UIColor.yellowColor)
    .font(font);
    // 粗字体
//    attributedStr.bFont(font);
    // 自定义字体
//    attributedStr.customFont(@"Party LET", font);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 空心字
- (IBAction)onClickHollow:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.bgColor(UIColor.yellowColor)
    .font(25)
    .stroke(UIColor.blueColor, 5);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 文字间距
- (IBAction)onClickSpace:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.bgColor(UIColor.yellowColor)
    .color(UIColor.redColor)
    .font(25)
    .kern(8);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 文字倾斜
- (IBAction)onClickObliqueness:(id)sender {
    float ob = arc4random() % 2 - 0.5;
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.bgColor(UIColor.yellowColor)
    .color(UIColor.redColor)
    .font(25)
    .kern(8)
    .obliqueness(ob);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 拉伸
- (IBAction)onClickExpansion:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.bgColor(UIColor.yellowColor)
    .color(UIColor.redColor)
    .font(25)
    .expansion(-0.5);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 基线偏移
- (IBAction)onClickBaselineOffset:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.bgColor(UIColor.yellowColor)
    .color(UIColor.redColor)
    .font(25)
    .expansion(-0.5)
    .baselineOffset(-5);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: Effect
- (IBAction)onClickEffect:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.bgColor(UIColor.grayColor)
    .color(UIColor.blackColor)
    .bFont(30)
    .textEffect();
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 网址格式，但不能点击，在textView上实现代理可以点击
- (IBAction)onClickLink:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world https://github.com/dlwj15/DLAttributedString"];
    attributedStr.bgColor(UIColor.whiteColor)
    .color(UIColor.redColor)
    .font(25)
    .link(@"https://github.com/dlwj15/DLAttributedString");
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: shadow
- (IBAction)onClickShadow:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.bgColor(UIColor.clearColor)
    .color(UIColor.greenColor)
    .bFont(30)
    .shadow(5, UIColor.redColor, CGSizeMake(6, 6));
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 拼接字符串
- (IBAction)onClickAppend:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.color(UIColor.redColor)
    .bgColor(UIColor.yellowColor)
    .font(25)
    .append(@"你能信这是第一次\n", ^(NSMutableAttributedString *make) {
        make.bgColor(UIColor.orangeColor)
        .bFont(20)
        .stroke(UIColor.purpleColor, 5);
    });
    attributedStr.append(@"不管你信不信，反正我信了", ^(NSMutableAttributedString *make) {
        make.bgColor(UIColor.purpleColor)
        .bFont(25)
        .color(UIColor.orangeColor)
        .obliqueness(0.3);
    });
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 图文混排
- (IBAction)onClickAttachment:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.bgColor(UIColor.whiteColor)
    .color(UIColor.grayColor)
    .font(25)
    .attachment(^(NSTextAttachment *textAttachment) {
        textAttachment.image = [UIImage imageNamed:@"PCHomePageVC_redPacket"];
        CGRect rect = CGRectMake(0, -3, textAttachment.image.size.width, textAttachment.image.size.height);
        textAttachment.bounds = rect;
    });
    attributedStr.append(@"https://github.com/dlwj15/DLAttributedString", ^(NSMutableAttributedString *make) {
        make.link(@"https://github.com/dlwj15/DLAttributedString");
    });
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 段落设置
- (IBAction)onClickParagraphStyle:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.color(UIColor.redColor)
    .bgColor(UIColor.yellowColor)
    .font(25)
    .append(@"你能信这是第一次\n", ^(NSMutableAttributedString *make) {
        make.bFont(20)
        .stroke(UIColor.purpleColor, 5);
    });
    attributedStr.append(@"不管你信不信，反正我信了, 不管你信不信，反正我信了", ^(NSMutableAttributedString *make) {
        make.bFont(25)
        .color(UIColor.orangeColor);
    });
    attributedStr.paragraphStyle(10, NSTextAlignmentLeft, ^(NSMutableParagraphStyle *paragraphStyle) {
        // 设置所需要的段落属性
    });
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 书写方向
- (IBAction)onClickWritingDirection:(id)sender {
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.color(UIColor.redColor)
    .bgColor(UIColor.yellowColor)
    .writingDirection(3);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 中划线
- (IBAction)onClickStrikethrough:(id)sender {
    // 自由组合产生不同的线条
    // NSUnderlinePatternDashDotDot | NSUnderlineStyleSingle
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.color(UIColor.redColor)
    .bgColor(UIColor.yellowColor)
    .strikethrough(NSUnderlineStyleSingle, UIColor.blackColor);
    self.attributedLabel.attributedText = attributedStr;
}

// TODO: 下划线
- (IBAction)onClickUnderLine:(id)sender {
    // 自由组合产生不同的线条
    // NSUnderlinePatternDashDotDot | NSUnderlineStyleSingle
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
    attributedStr.color(UIColor.redColor)
    .bgColor(UIColor.yellowColor)
    .underLine(NSUnderlineStyleSingle, UIColor.blackColor);
    self.attributedLabel.attributedText = attributedStr;
}



@end

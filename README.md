# DLAttributedString
## 链式开发富文本
    由于公司使用很多个性化文本，若使用系统提供的NSMutableAttributedString书写实在太冗余了，代码可读性也很差。如果能像Masonry一样书写代码就完美了。废话不多说，直接操刀干起来。

### Installation
Use the orsome [CocoaPods](https://github.com/CocoaPods/CocoaPods).
In your Podfile
```
pod 'DLAttributedString'
```
或者直接拖拽引入工程中

### 使用该链式开发富文本有两种书写方式
```
第一种 
NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
attributedStr.color(UIColor.redColor)
.bgColor(UIColor.yellowColor);
```
``` 
第二种
NSMutableAttributedString *attributedStr = [NSMutableAttributedString attributedWithString:@"hello world"];
attributedStr.color(UIColor.redColor).bgColor(UIColor.yellowColor);
```
### 具体的使用请下载demo进行查看

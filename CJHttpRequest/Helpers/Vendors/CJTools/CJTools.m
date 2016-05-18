//
//  CJTools.m
//  JKHome
//
//  Created by chenamei on 16/1/24.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import "CJTools.h"

@implementation CJTools

@end

@implementation CJViewLayer

+ (instancetype)cjLayerView:(UIView *)originalView color:(UIColor *)color radius:(CGFloat)radius{
    
    return [[self alloc] initWithLayerView:originalView color:color radius:radius];
}


- (instancetype)initWithLayerView:(UIView *)originalView color:(UIColor *)color radius:(CGFloat)radius{
    if (self = [super init]) {
        originalView.layer.borderWidth = 1.0;
        originalView.layer.borderColor = color.CGColor;
        originalView.layer.cornerRadius = radius;
        originalView.layer.masksToBounds = YES;
    }
    return self;
}

@end


@implementation CJSettingViewProperty

+ (instancetype)cjSettingProperty:(id)originaView backgroundColor:(UIColor *)color{
    return [[self alloc] initWithSettingLabelProperty:originaView backgroundColor:color];
}


- (instancetype)initWithSettingLabelProperty:(id)originaView backgroundColor:(UIColor *)color{
    if (self = [super init]) {

    }
    return self;
}

+ (instancetype)cjSettingLabelProperty:(id)originaView backgroundColor:(UIColor *)color textColor:(UIColor *)textColor textPosition:(NSTextAlignment)textPosition{
    return [[self alloc] initWithSettingLabelProperty:originaView backgroundColor:color textColor:textColor textPosition:textPosition];
}

- (instancetype)initWithSettingLabelProperty:(id)originaView backgroundColor:(UIColor *)color textColor:(UIColor *)textColor textPosition:(NSTextAlignment)textPosition{
    if (self = [super init]) {
        if ([[originaView class] isEqual:[UILabel class]]) {
            UILabel *originaLabel = (UILabel *)originaView;
            originaLabel.backgroundColor = color;
            originaLabel.textColor = textColor;
            originaLabel.textAlignment = textPosition;
        }
        
    }
    return self;
}

@end


#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0];
#define kLineCount 6//线条数量
#define kLineWidth 1.0//线条宽度
#define kCharCount 4//字符个数
#define kFontSize [UIFont systemFontOfSize:arc4random() % 5 + 15]

@implementation AuthcodeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        self.backgroundColor = kRandomColor;
        
        [self getAuthcode];//获得随机验证码
    }
    return self;
}
#pragma mark 获得随机验证码
- (void)getAuthcode{
    //字符串素材
    _dataArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    
    self.authCodeStr = [[NSMutableString alloc] initWithCapacity:kCharCount];
    //随机从数组中选取需要个数的字符串，拼接为验证码字符串
    for (int i = 0; i < kCharCount; i++)
    {
        NSInteger index = arc4random() % (_dataArray.count-1);
        NSString *tempStr = [_dataArray objectAtIndex:index];
        self.authCodeStr = (NSMutableString *)[self.authCodeStr stringByAppendingString:tempStr];
    }
}
#pragma mark 点击界面切换验证码
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self getAuthcode];
    
    //setNeedsDisplay调用drawRect方法来实现view的绘制
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    //设置随机背景颜色
    self.backgroundColor = kRandomColor;
    
    //根据要显示的验证码字符串，根据长度，计算每个字符串显示的位置
    NSString *text = [NSString stringWithFormat:@"%@",self.authCodeStr];
    
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    int width = rect.size.width/text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    
    CGPoint point;
    
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX,pY;
    for ( int i = 0; i<text.length; i++)
    {
        pX = arc4random() % width + rect.size.width/text.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize}];
    }
    
    //调用drawRect：之前，系统会向栈中压入一个CGContextRef，调用UIGraphicsGetCurrentContext()会取栈顶的CGContextRef
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线条宽度
    CGContextSetLineWidth(context, kLineWidth);
    
    //绘制干扰线
    for (int i = 0; i < kLineCount; i++)
    {
        UIColor *color = kRandomColor;
        CGContextSetStrokeColorWithColor(context, color.CGColor);//设置线条填充色
        
        //设置线的起点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        //设置线终点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        //画线
        CGContextStrokePath(context);
    }
}

@end


@implementation UIColor (UIColor_Hex)
+(UIColor*)colorWithHexString:(NSString*)hexstring
{
    return [self colorWithHexString:hexstring alpha:1.0];
}
+(UIColor*)colorWithHexString:(NSString *)hexstring alpha:(CGFloat)alpha
{
    NSString* colorString = [[hexstring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([colorString length] < 6)
    {
        return [UIColor clearColor];
    }
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([colorString hasPrefix:@"0X"])
    {
        colorString = [colorString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([colorString hasPrefix:@"#"])
    {
        colorString = [colorString substringFromIndex:1];
    }
    //这里的colorString 已经 经过了上面两个if语句的筛选截取，跟最初的开始发生了变化
    if ([colorString length]!= 6)
    {
        return [UIColor clearColor];
    }
    //截取颜色字符串
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [colorString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}
@end


@implementation CJTextSizeWithString

/**
 *  param: string:需要计算的文本text
 *  param: font :文本显示的字体大小
 *  param: maxSize:文本显示的范围
 *  return: 文本占用的真实宽高
 */
+ (CGSize)cjSizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end


@implementation CJShowAlertMsg

+ (void)cjShowAlertMessage:(NSString *)message{// currentView:(UIView *)view{
    UIWindow *windows = [UIApplication sharedApplication].keyWindow;
    
    UIView *bgView = [[UIView alloc] initWithFrame:windows.frame];
    bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    bgView.alpha = 0.0;
    [windows addSubview:bgView];
    
    
    UIFont *textFont = [UIFont systemFontOfSize:15];
    CGSize textSize = [CJTextSizeWithString cjSizeWithString:message font:textFont maxSize:CGSizeMake((windows.frame.size.width - 100), CGFLOAT_MAX)];
    
    CGFloat alertLabelW = textSize.width + 20;
    CGFloat alertLabelH = textSize.height + 20;
    CGFloat alertLabelX = (windows.frame.size.width - alertLabelW)/2.0;
    CGFloat alertLabelY = (windows.frame.size.height - alertLabelH)/2.0;
    
    UILabel *alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(alertLabelX, alertLabelY, alertLabelW, alertLabelH)];
    alertLabel.backgroundColor = [UIColor cyanColor];
    alertLabel.text = message;
    alertLabel.textColor = [UIColor blackColor];
    alertLabel.font = textFont;
    alertLabel.numberOfLines = 0;
    alertLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:alertLabel];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        bgView.alpha = 1.0;
    } completion:nil];
    
    //计算alertLabel行数
    CGFloat labelHeight = [alertLabel sizeThatFits:CGSizeMake(alertLabel.frame.size.width, MAXFLOAT)].height;
    NSNumber *count = @((labelHeight) / alertLabel.font.lineHeight);
    //    NSLog(@"共 %td 行", [count integerValue]);
    
    NSTimeInterval timeInterval = (alertLabelW/60.0) * [count integerValue];
    NSLog(@"############timeInterval:%f",timeInterval);
    
    if (timeInterval < 1.5) {
        timeInterval = 1.5;
    }
    
    NSLog(@"start");
    [UIView animateWithDuration:timeInterval delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        bgView.alpha = 0.0;
        NSLog(@"end");
    } completion:^(BOOL finished) {
        NSLog(@"remove");
        [bgView removeFromSuperview];
    }];
}

@end

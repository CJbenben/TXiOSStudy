//
//  TXPerson.m
//  01-runtime
//
//  Created by chenxiaojie on 2021/8/5.
//

#import "TXPerson.h"

@interface TXPerson ()

{
    char _tallRichHandsome;// 只占1个字节
}

@end

@implementation TXPerson

// 掩码，一般用于按位与（&）运算的
//#define TXTallMask  0b00000001
//#define TXRichMask  0b00000010
//#define TXHandsomeMask  0b00000100

//#define TXTallMask  1
//#define TXRichMask  2
//#define TXHandsomeMask  4

#define TXTallMask  (1<<0) // 1向左移动0位，所以还是1
#define TXRichMask  (1<<1) // 1向左移动1位，0b00000010
#define TXHandsomeMask  (1<<2) // 1向左移动2位，0b00000100


- (instancetype)init {
    if (self = [super init]) {
        _tallRichHandsome = 0b00000100;
    }
    return self;
}

// 设置值的时候，只设置当前位的值，其他位保留不动
- (void)setTall:(BOOL)tall {
    /*
    if (tall) {
        0001 0110
    |   0000 0001 TXTallMask
    ----------------
        0001 0111
    } else {
        0001 0101
    &   1111 1110 ~TXTallMask 二进制取反
    ----------------
        0001 0100
    }*/
    if (tall) {
//        _tallRichHandsome = _tallRichHandsome | TXTallMask;
        // 简写
        _tallRichHandsome |= TXTallMask;
    } else {
        _tallRichHandsome &= (~TXTallMask);
    }
}

- (void)setRich:(BOOL)rich {
    if (rich) {
        _tallRichHandsome |= TXRichMask;
    } else {
        _tallRichHandsome &= ~TXRichMask;
    }
}

- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _tallRichHandsome |= TXHandsomeMask;
    } else {
        _tallRichHandsome &= ~TXHandsomeMask;
    }
}

/** 从右向左第一位 */
- (BOOL)isTall {
//    return !!(_tallRichHandsome & 0b00000001);
//    return !!(_tallRichHandsome & 1);
    return !!(_tallRichHandsome & TXTallMask);
}

/** 从右向左第二位 */
- (BOOL)isRich {
//    return !!(_tallRichHandsome & 0b00000010);
//    return !!(_tallRichHandsome & 2);
    return !!(_tallRichHandsome & TXRichMask);
}

/** 从右向左第三位 */
- (BOOL)isHandsome {
//    return !!(_tallRichHandsome & 0b00000100);
//    return !!(_tallRichHandsome & 4);
    return !!(_tallRichHandsome & TXHandsomeMask);
}

/*
 & 与 操作             | 或 操作
   0000 0111            0000 0111
&  0000 0101         |  0000 0101
----------------  ------------------
   0000 0101            0000 0111
 
 */
@end

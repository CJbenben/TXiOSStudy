//
//  TXPerson.m
//  01-runtime
//
//  Created by chenxiaojie on 2021/8/5.
//

#import "TXPerson.h"

@interface TXPerson ()

{
    /* 共用体 */
    union {
        char bits;// 只占一个字节
        struct {// 只为增加可读性，可直接删除
            char tall : 1;
            char rich : 1;
            char handsome : 1;
        };
    } _tallRichHandsome;
}

@end

@implementation TXPerson

#define TXTallMask  (1<<0) // 1向左移动0位，所以还是1
#define TXRichMask  (1<<1) // 1向左移动1位，0b00000010
#define TXHandsomeMask  (1<<2) // 1向左移动2位，0b00000100

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
        _tallRichHandsome.bits |= TXTallMask;
    } else {
        _tallRichHandsome.bits &= ~TXTallMask;
    }
}

- (void)setRich:(BOOL)rich {
    if (rich) {
        _tallRichHandsome.bits |= TXRichMask;
    } else {
        _tallRichHandsome.bits &= ~TXRichMask;
    }
}

- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _tallRichHandsome.bits |= TXHandsomeMask;
    } else {
        _tallRichHandsome.bits &= ~TXHandsomeMask;
    }
}
- (BOOL)isTall {
    return !!(_tallRichHandsome.bits & TXTallMask);
}

- (BOOL)isRich {
    return !!(_tallRichHandsome.bits & TXRichMask);
}

- (BOOL)isHandsome {
    return !!(_tallRichHandsome.bits & TXHandsomeMask);
}

@end

//
//  TXPerson.m
//  01-runtime
//
//  Created by chenxiaojie on 2021/8/5.
//

#import "TXPerson.h"

@interface TXPerson ()

{
    /* 结构体支持这种位域的形式 */
    struct {
        char tall : 1; // 只占一位
        char rich : 1; // 只占一位
        char handsome : 1; // 只占一位
    } _tallRichHandsome; // 一个字节 0b0000 0000(0b0000 0hrt)
}

@end

@implementation TXPerson

- (void)setTall:(BOOL)tall {
    _tallRichHandsome.tall = tall;
}

- (void)setRich:(BOOL)rich {
    _tallRichHandsome.rich = rich;
}

- (void)setHandsome:(BOOL)handsome {
    _tallRichHandsome.handsome = handsome;
}

- (BOOL)isTall {
    return !!(_tallRichHandsome.tall);
}

- (BOOL)isRich {
    return !!(_tallRichHandsome.rich);
}

- (BOOL)isHandsome {
    return !!(_tallRichHandsome.handsome);
}

@end

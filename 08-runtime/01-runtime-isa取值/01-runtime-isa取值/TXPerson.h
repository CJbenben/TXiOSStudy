//
//  TXPerson.h
//  01-runtime
//
//  Created by chenxiaojie on 2021/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TXPerson : NSObject

//@property (nonatomic, assign) BOOL tall; // 1个字节
//@property (nonatomic, assign) BOOL rich; // 1个字节
//@property (nonatomic, assign) BOOL handsome; // 1个字节

//TXPerson 对象里面三个属性就3个字节，加上 isa 11个字节，所以系统会分配16个字节给 TXPerson，那么如何只分配一个字节给三个变量呢？

- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;
- (BOOL)isTall;
- (BOOL)isRich;
- (BOOL)isHandsome;

@end

NS_ASSUME_NONNULL_END

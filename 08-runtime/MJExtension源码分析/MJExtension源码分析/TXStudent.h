//
//  TXStudent.h
//  MJExtension源码分析
//
//  Created by chenxiaojie on 2022/11/2.
//

#import "TXPerson.h"
#import "TXCat.h"

NS_ASSUME_NONNULL_BEGIN

@interface TXStudent : TXPerson

@property (nonatomic, assign) int no;
@property (nonatomic, strong) TXCat *cat;

@end

NS_ASSUME_NONNULL_END

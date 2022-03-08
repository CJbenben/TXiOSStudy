//
//  main.m
//  15-block测试
//
//  Created by chenxiaojie on 2021/8/4.
//

#import <Foundation/Foundation.h>

typedef void(^Block)(id);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Block block;
        {
            id ary = [NSMutableArray array];
            __weak typeof (ary) ary2  = ary;
            block = ^(id obj){
                [ary2 addObject:obj];
                NSLog(@"array = %@", ary2);
            };
        }
        
        
        block([[NSObject alloc] init]);
        block([[NSObject alloc] init]);
        block([[NSObject alloc] init]);
    }
    return 0;
}

//
//  main.m
//  01-KVC基本使用
//
//  Created by chenxiaojie on 2021/7/27.
//

#import <Foundation/Foundation.h>

@interface TXStudent : NSObject

@property (nonatomic, assign) CGFloat source;

@end

@implementation TXStudent

@end


@interface TXPerson : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, strong) TXStudent *stu;

@end

@implementation TXPerson

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TXStudent *student = [[TXStudent alloc] init];
        
        TXPerson *person = [[TXPerson alloc] init];
        person.stu = student;
        [person setValue:@10 forKey:@"age"];
        [person setValue:@12 forKey:@"AGE"];
        [person setValue:@99.3 forKeyPath:@"stu.source"];
        
        NSLog(@"age = %d, source = %.2f", person.age, person.stu.source);
        
        id age = [person valueForKey:@"age"];
        id source = [person valueForKeyPath:@"stu.source"];
        NSLog(@"age = %@, source = %@", age, source);
        
    }
    return 0;
}

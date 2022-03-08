//
//  TXPermenantThread.m
//  07-RunLoop线程的封装OC
//
//  Created by chenxiaojie on 2021/9/8.
//

#import "TXPermenantThread.h"

@interface TXThread : NSThread
@end
@implementation TXThread
- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end

@interface TXPermenantThread ()
/** 内部线程 */
@property (nonatomic, strong) TXThread *innerThread;
@end

@implementation TXPermenantThread


- (instancetype)init {
    if (self = [super init]) {
        
    
        self.innerThread = [[TXThread alloc] initWithBlock:^{
            
            NSLog(@"------------begin");
            
            CFRunLoopSourceContext context = {0};
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(CFAllocatorGetDefault(), 0, &context);
            // 向 runloop 中添加 sources
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            
            /**
             第三个参数 returnAfterSourceHandled
             设置为 true 代表 执行完 source 后会退出当前loop，
             设置为 false ，执行完 source 不会退出当前 loop， 所以就不需要 设置 stopped 进行标记了
             */
            // 启动
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
            
//            while (weakSelf && !weakSelf.isStopped) {
//                CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
//            }
            
            NSLog(@"------------end");
        }];
        [self.innerThread start];
    }
    return self;
}

- (void)run {
    if (!self.innerThread) return;
    [self.innerThread start];
}

- (void)executeTask:(TXPermenantThreadTask)task {
    if (!self.innerThread || !task) return;
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

- (void)stop {
    if (!self.innerThread) return;
    [self performSelector:@selector(__stopThread) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self stop];
}

#pragma mark - private
- (void)__stopThread {
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)__executeTask:(TXPermenantThreadTask)task {
    task();
}

@end

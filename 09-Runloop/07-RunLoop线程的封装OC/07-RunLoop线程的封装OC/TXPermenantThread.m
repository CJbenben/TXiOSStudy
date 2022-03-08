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
@property (nonatomic, assign, getter=isStopped) BOOL stopped;
@end

@implementation TXPermenantThread


- (instancetype)init {
    if (self = [super init]) {
        
        self.stopped = NO;
        __weak typeof(self) weakSelf = self;
        self.innerThread = [[TXThread alloc] initWithBlock:^{
            
            NSLog(@"------------begin");
            
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            
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
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)__executeTask:(TXPermenantThreadTask)task {
    task();
}

@end

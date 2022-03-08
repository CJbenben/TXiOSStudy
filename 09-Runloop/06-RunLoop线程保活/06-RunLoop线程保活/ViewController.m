//
//  ViewController.m
//  01-认识RunLoop
//
//  Created by chenxiaojie on 2021/9/2.
//

#import "ViewController.h"
#import "TXThread.h"

// 如何让一个子线程一直保留，而不是每次需要的时候再次创建
@interface ViewController ()

@property (nonatomic, strong) TXThread *thread;
@property (nonatomic, assign) BOOL stopped;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    //[self questation];
    
    __weak typeof(self) weakSelf = self;
    self.stopped = NO;
    // 可以通过 runloop 让子线程保活
    self.thread = [[TXThread alloc] initWithBlock:^{
        NSLog(@"------ begin ----- %@", [NSThread currentThread]);
        
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        while (weakSelf && !weakSelf.stopped) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
         
        /**
         it runs the receiver in the NSDefaultRunLoopMode by repeatedly invoking runMode:beforeDate:.
         In other words, this method effectively begins an infinite loop that processes data from the run loop’s input sources and timers.
         */
        //[[NSRunLoop currentRunLoop] run];
        
        
        // 既然没有执行到这里，说明 runloop 生效了，线程已经保活了
        NSLog(@"------ end ------");
    }];
    [self.thread start];
    
    // 这样写 NSThread 会导致循环引用 dealloc 方法不执行
//    self.thread = [[TXThread alloc] initWithTarget:self selector:@selector(run2) object:nil];
//    [self.thread start];
}

- (IBAction)stop {
    // 需要停止子线程的 runloop
    // 注：waitUntilDone 这个参数
    // NO: 表示不等待，后面有代码就执行，然后执行 stopThread
    // YES：表示需要等待 stopThread 方法执行完之后才会执行下面代码
    if (!self.thread) return;
    
    [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:YES];
    NSLog(@"123");
}

- (void)stopThread {
    // 设置 runloop 停止标记
    self.stopped = YES;
    // 停止 runloop
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    self.thread = nil;
    NSLog(@"%s --- %@", __func__, [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.thread) return;
    [self performSelector:@selector(run2) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void)run2 {
    NSLog(@"%s --- %@", __func__, [NSThread currentThread]);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self stop];
}





// 如果遮样操作，每次执行完 run 方法，子线程就销毁了
- (void)questation {
    
    TXThread *thread = [[TXThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [thread start];
}

- (void)run {
    NSLog(@"%s --- %@", __func__, [NSThread currentThread]);
    
    // 如果这里不添加 port 或者 observers timers，那么 mode 里面没有任何 sources0 sources1 timers observers，自然就结束了
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    
    NSLog(@"------ end ------");
}

@end

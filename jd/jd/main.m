//
//  main.m
//  jd
//
//  Created by abbott on 2017/10/27.
//  Copyright © 2017年 NIP. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^TestBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *test = @"test";
        TestBlock block = ^(){
//            dispatch_sync(dispatch_queue_create("jdtest", DISPATCH_QUEUE_SERIAL), ^{
                NSLog(@"test = %@ thread = %@",test,[NSThread currentThread]);
//            });
        };
        test = @"test1";
        block();
    }
    return 0;
}

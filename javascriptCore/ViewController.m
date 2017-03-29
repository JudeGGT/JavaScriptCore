//
//  ViewController.m
//  JavaScriptCore
//
//  Created by ggt on 2017/3/29.
//  Copyright © 2017年 GGT. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()

@property (nonatomic, strong) JSContext *jsContext;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self jsRun_OCFunctionParatter];
}


#pragma mark - UI


#pragma mark - Constraints


#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private

/**
 OC 调用 JS 方法（无参数）
 */
- (void)ocRun_jsFunction {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JavaScriptCode" ofType:@"js"];
    NSData *jsData = [[NSData alloc] initWithContentsOfFile:path];
    NSString *jsCode = [[NSString alloc] initWithData:jsData encoding:NSUTF8StringEncoding];
    self.jsContext = [[JSContext alloc] init];
    [self.jsContext evaluateScript:jsCode];
}

/**
  OC 调用 JS 方法（有参数）
 */
- (void)ocRun_jsFunctionWithParatter:(NSString *)paratter {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JavaScriptCode" ofType:@"js"];
    NSData *jsData = [[NSData alloc] initWithContentsOfFile:path];
    NSString *jsCode = [[NSString alloc]initWithData:jsData encoding:NSUTF8StringEncoding];
    jsCode = [NSString stringWithFormat:jsCode, paratter];
    self.jsContext = [[JSContext alloc] init];
    [self.jsContext evaluateScript:jsCode];
}

/**
 JS 调用 OC 方法（无参数）
 */
- (void)jsRun_OCFunction {
    
    void (^block)() = ^{
        NSLog(@"恋之蔓千寻");
    };
    self.jsContext = [[JSContext alloc] init];
    [self.jsContext setObject:block forKeyedSubscript:@"objc_hello"];
}


/**
 JS 调用 OC 方法（有参数）
 */
- (void)jsRun_OCFunctionParatter {
    
    void (^block)(NSString *, NSString *) = ^(NSString *bookName, NSString *bookAuto) {
        NSLog(@"书名：《%@》   作者：%@", bookName, bookAuto);
    };
    self.jsContext = [[JSContext alloc] init];
    [self.jsContext setObject:block forKeyedSubscript:@"objc_helloParatter"];
}


#pragma mark - Protocol


#pragma mark - 懒加载




@end

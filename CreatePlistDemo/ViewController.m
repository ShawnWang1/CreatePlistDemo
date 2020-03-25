//
//  ViewController.m
//  CreatePlistDemo
//
//  Created by shawn on 2020/3/25.
//  Copyright © 2020 shawn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self aaa];
}

- (void)aaa
{
    NSDictionary *userDictionary = @{@"name":@"花花",
                                     @"age":@"18"
                                     
    };
    
    ///获取本地沙盒Document路径
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [documentPath objectAtIndex:0];
    
    ///在Document路径下拼接文件名字
    NSString *plistPath = [path stringByAppendingPathComponent:@"CodeCreatePlistList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    ///检测plistPath路径是否存在
    BOOL isFile = [fileManager fileExistsAtPath:plistPath];
    
    if (isFile) {
        ///文件存在 删除之后 写入
        [fileManager removeItemAtPath:plistPath error:nil];
    }
    
    ///plist文件写入
    BOOL isSuccess = [userDictionary writeToFile:plistPath atomically:YES];
    NSLog(@"写入成功 %@",@(isSuccess));
}

- (void)sss
{
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CodeCreatePlistList" ofType:@"plist"];
    
    NSMutableDictionary *userDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    NSString *name = userDictionary[@"name"];
    NSString *age = userDictionary[@"age"];
    NSLog(@"name:%@  \n  age:%@",name,age);
    
}


@end

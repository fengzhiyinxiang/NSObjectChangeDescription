//
//  NSObject+load.h
//  yimei
//
//  Created by YJD on 2017/6/19.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (load)

//打开或关闭方法 断点后 lldb  po [NSObject changeDescription]
+(void)exchangeImplementations;

@end

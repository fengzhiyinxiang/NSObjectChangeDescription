//
//  NSObject+ChangeDescription.m
//  yimei
//
//  Created by YJD on 2017/6/19.
//  Copyright © 2017年 yixin. All rights reserved.
//

#import "NSObject+ChangeDescription.h"
#import <objc/runtime.h>

@implementation NSObject (ChangeDescription)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementations];
    });
}

+(void)exchangeImplementations{
#ifdef DEBUG
    Method descriptionMethod = class_getInstanceMethod([self class], @selector(description));
    Method my_descriptionMethod = class_getInstanceMethod([self class], @selector(my_description));
    method_exchangeImplementations(descriptionMethod, my_descriptionMethod);
#endif
}

-(NSString *)my_description{
    NSString *className = NSStringFromClass([self class]);
    if ([className hasSuffix:@"Model"]) {
        NSMutableDictionary *propertyMutDic = [NSMutableDictionary dictionary];
        
        uint count;
        objc_property_t *properties = class_copyPropertyList([self class], &count);
        
        for (int i = 0; i<count; i++) {
            objc_property_t property = properties[i];
            NSString *name = @(property_getName(property));
            id value = [self valueForKey:name]?:@"nil";
            [propertyMutDic setObject:value forKey:name];
        }
        
        free(properties);
        NSString *desString = [NSString stringWithFormat:@"<%@: %p> -- %@",[self class],self,propertyMutDic];
        return desString;
        
    }else{
        return [self my_description];
    }
}


@end

//
//  Runtime.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "Runtime.h"
#import <objc/runtime.h>

@implementation Runtime

@end


@interface Runtime_IMP ()

@property (nonatomic) BOOL  isClassMethod;
@property (nonatomic) Class aClass;
@property (nonatomic) SEL   selector;

@end

@implementation Runtime_IMP

+ (instancetype)impWithClass:(Class)aClass name:(SEL)name isClassMethod:(BOOL)isClassMethod {
    
    Runtime_IMP *imp  = [Runtime_IMP new];
    imp.aClass        = aClass;
    imp.selector      = name;
    imp.isClassMethod = isClassMethod;
    
    return imp;
}

- (char *)typeEncoding {
    
    Class class = self.isClassMethod ? objc_getMetaClass(NSStringFromClass(self.aClass).UTF8String) : self.aClass;
    return (char *)method_getTypeEncoding(class_getInstanceMethod(class, self.selector));
}

- (IMP)imp {
    
    Class class = self.isClassMethod ? objc_getMetaClass(NSStringFromClass(self.aClass).UTF8String) : self.aClass;
    return class_getMethodImplementation(class, self.selector);
}

@end

@implementation Runtime_Method

+ (BOOL)addMethodWithClass:(Class)aClass methodName:(SEL)name methodIMP:(Runtime_IMP *)imp; {

    Class class = imp.isClassMethod ? objc_getMetaClass(NSStringFromClass(aClass).UTF8String) : aClass;
    return class_addMethod(class, name, imp.imp, imp.typeEncoding);
}

+ (void)replaceMethodWithClass:(Class)aClass methodName:(SEL)name methodIMP:(Runtime_IMP *)imp {
    
    Class class = imp.isClassMethod ? objc_getMetaClass(NSStringFromClass(aClass).UTF8String) : aClass;
    class_replaceMethod(class, name, imp.imp, imp.typeEncoding);
}

+ (void)exchangeMethodIMP:(Runtime_IMP *)imp1 withIMP:(Runtime_IMP *)imp2 {
    
    if (imp1.isClassMethod == NO && imp2.isClassMethod == NO) {
        
        method_exchangeImplementations(class_getInstanceMethod(imp1.aClass, imp1.selector),
                                       class_getInstanceMethod(imp2.aClass, imp2.selector));
        
    } else if (imp1.isClassMethod == YES && imp2.isClassMethod == YES) {
        
        method_exchangeImplementations(class_getClassMethod(imp1.aClass, imp1.selector),
                                       class_getClassMethod(imp2.aClass, imp2.selector));
        
    } else {
        
        [NSException raise:@"参数错误" format:@"IMP1与IMP2的isClassMethod的值不匹配。"];
    }
}

@end


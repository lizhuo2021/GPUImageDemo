//
//  Runtime.h
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Runtime : NSObject

@end


@interface Runtime_IMP : Runtime

/**
 从一个指定的class里面获取他的IMP

 @param aClass 指定的class
 @param name 方法的名字
 @param isClassMethod 是否是类方法
 @return 指定的class里的IMP
 */
+ (instancetype)impWithClass:(Class)aClass name:(SEL)name isClassMethod:(BOOL)isClassMethod;

@property (nonatomic, readonly) BOOL  isClassMethod; // 是否是类方法
@property (nonatomic, readonly) Class aClass;        // 指定的类
@property (nonatomic, readonly) SEL   selector;      // 指定的类中的方法

@property (nonatomic, readonly) char *typeEncoding; // 方法的信息（参数值、返回值）
@property (nonatomic, readonly) IMP   imp;          // 方法的地址指针

@end

@interface Runtime_Method : Runtime

/**
 给一个指定的类添加一个方法

 @param aClass 指定的类
 @param name 新的方法名字
 @param imp name要绑定的IMP(IMP包含了完整的类名，以及该类的一个方法，以及是否是类方法)
 @return 是否添加成功
 */
+ (BOOL)addMethodWithClass:(Class)aClass methodName:(SEL)name methodIMP:(Runtime_IMP *)imp;

/**
 给一个指定的类替换方法

 @param aClass 指定的类
 @param name 要被替换的方法的名字
 @param imp 被替换方法的IMP
 */
+ (void)replaceMethodWithClass:(Class)aClass methodName:(SEL)name methodIMP:(Runtime_IMP *)imp;

/**
 交换方法

 @param imp1 交换方法的IMP
 @param imp2 交换方法的IMP
 */
+ (void)exchangeMethodIMP:(Runtime_IMP *)imp1 withIMP:(Runtime_IMP *)imp2;

@end


NS_ASSUME_NONNULL_END

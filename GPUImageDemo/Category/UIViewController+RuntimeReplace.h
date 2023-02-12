//
//  UIViewController+RuntimeReplace.h
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (RuntimeReplace)

+ (void)debug_runtime_replace;

@end

NS_ASSUME_NONNULL_END

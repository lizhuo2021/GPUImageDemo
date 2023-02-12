//
//  GIDDemoListModel.h
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GIDDemoListModel : NSObject

@property (nonatomic, copy) NSString *showName;
@property (nonatomic, strong) id object;
@property (nonatomic) NSInteger index;

+ (instancetype)modelWithObject:(id)object
                       showName:(NSString *)showName;

@end

NS_ASSUME_NONNULL_END

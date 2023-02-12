//
//  GIDDemoListModel.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "GIDDemoListModel.h"

@implementation GIDDemoListModel



+ (instancetype)modelWithObject:(id)object
                       showName:(NSString *)showName {
    
    GIDDemoListModel *model  = [[self class] new];
    model.object = object;
    model.showName = showName;
    
    return model;
}

@end

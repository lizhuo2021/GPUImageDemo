//
//  GIDCellData.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "GIDCellData.h"

@implementation GIDCellData

+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data
                                  cellHeight:(CGFloat)height
                                   cellWidth:(CGFloat)width
                                        type:(NSInteger)type {
    GIDCellData *cellData = [[self class] new];
    
    cellData.reuseIdentifier = reuseIdentifier;
    cellData.data = data;
    cellData.cellHeight = height;
    cellData.cellWidth = width;
    cellData.cellType = type;
    return cellData;
}
    

+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data
                                  cellHeight:(CGFloat)height
                                        type:(NSInteger)type{
    return [self cellDataWithReuseIdentifier:reuseIdentifier data:data cellHeight:height cellWidth:0 type:type];
}

+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data
                                  cellHeight:(CGFloat)height {
    return [self cellDataWithReuseIdentifier:reuseIdentifier data:data cellHeight:height cellWidth:0 type:0];
}

+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data {
    return [self cellDataWithReuseIdentifier:reuseIdentifier data:data cellHeight:0 cellWidth:0 type:0];
}

@end

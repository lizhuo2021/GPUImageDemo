//
//  GIDCellData.h
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GIDCellData : NSObject

@property(nonatomic, strong) Class cellClass;

@property (nonatomic, copy) NSString *reuseIdentifier;

@property (nonatomic, strong) id data;

@property (nonatomic) CGFloat cellHeight;

@property (nonatomic) CGFloat cellWidth;

@property (nonatomic) NSInteger cellType;

@property (nonatomic) CGSize itemSize;


+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data
                                  cellHeight:(CGFloat)height
                                   cellWidth:(CGFloat)width
                                        type:(NSInteger)type;

+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data
                                  cellHeight:(CGFloat)height
                                        type:(NSInteger)type;

+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data
                                  cellHeight:(CGFloat)height;

+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data;

@end

NS_ASSUME_NONNULL_END

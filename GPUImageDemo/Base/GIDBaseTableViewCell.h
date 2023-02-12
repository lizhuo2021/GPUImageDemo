//
//  GIDBaseTableViewCell.h
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

#import "GIDCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface GIDBaseTableViewCell : UITableViewCell

@property(nonatomic, strong) GIDCellData *cellData;

- (void)setupCell;

- (void)buildSubview;

- (void)loadContent;


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

+ (GIDCellData *)cellDataWithData:(id)data;

@end

NS_ASSUME_NONNULL_END

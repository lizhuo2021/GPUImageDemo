//
//  GIDBaseTableViewCell.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "GIDBaseTableViewCell.h"

@implementation GIDBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupCell];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setupCell {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

- (void)setCellData:(GIDCellData *)cellData {
    _cellData = cellData;
    [self loadContent];
}


+ (GIDCellData *)cellDataWithReuseIdentifier:(NSString *)reuseIdentifier
                                        data:(id)data
                                  cellHeight:(CGFloat)height
                                   cellWidth:(CGFloat)width
                                        type:(NSInteger)type {
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    GIDCellData *cd = [GIDCellData cellDataWithReuseIdentifier:tmpReuseIdentifier data:data cellHeight:height cellWidth:width type:type];
    cd.cellClass = [self class];
    return cd;
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

+ (GIDCellData *)cellDataWithData:(id)data {
    return [self cellDataWithReuseIdentifier:nil data:data cellHeight:0 cellWidth:0 type:0];
}

@end

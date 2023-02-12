//
//  GIDDemoListCell.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "GIDDemoListCell.h"
#import "GIDDemoListModel.h"

@interface GIDDemoListCell ()

@property(nonatomic, strong) UILabel *name;

@end

@implementation GIDDemoListCell

- (void)setupCell {
    
    
    
}

- (void)buildSubview {
    [self.contentView addSubview:self.name];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 15, 10, 15));
        make.height.mas_equalTo(25);
    }];
}

- (void)loadContent {
    if (self.cellData.data) {
        GIDDemoListModel *model = self.cellData.data;
        self.name.text = model.showName;
    }
}

- (UILabel *)name {
    if (!_name) {
        _name = [UILabel new];
        _name.textColor = UIColor.blackColor;
        _name.font = [UIFont boldSystemFontOfSize:15];
    }
    return _name;
}



@end

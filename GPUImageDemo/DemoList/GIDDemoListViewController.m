//
//  GIDDemoListViewController.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "GIDDemoListViewController.h"
#import "GIDDemoListCell.h"
#import "GIDDemoListModel.h"

#import "GIDColorFiltersViewController.h"
#import "GIDImageFiltersViewController.h"

@interface GIDDemoListViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation GIDDemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)setupSubViews {
    
    self.navigationItem.title = @"GPUImage Demo";
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
}

- (void)setupDataSource {
    

    
    NSArray *array = @[
        [GIDDemoListModel modelWithObject:GIDColorFiltersViewController.class showName:@"颜色调整"],
        [GIDDemoListModel modelWithObject:GIDImageFiltersViewController.class showName:@"图像处理"],
    ];
    
    
    self.dataSource = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(GIDDemoListModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.index = idx + 1;
        [self.dataSource addObject:[GIDDemoListCell cellDataWithData:obj]];
    }];
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GIDCellData *cd = [self.dataSource objectAtIndex:indexPath.row];
    
    GIDBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cd.reuseIdentifier];
    if (!cell &&
        cd.cellClass) {
        cell = [[cd.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cd.reuseIdentifier];
    }
    [cell setCellData:cd];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GIDCellData *cd = [self.dataSource objectAtIndex:indexPath.row];
    GIDDemoListModel *model = cd.data;
    if (!model) return;
    UIViewController *controller  = [model.object new];
    controller.title = model.showName;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end

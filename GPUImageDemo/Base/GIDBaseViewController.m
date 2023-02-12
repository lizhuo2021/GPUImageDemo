//
//  GIDBaseViewController.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "GIDBaseViewController.h"

@interface GIDBaseViewController ()

@end

@implementation GIDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubViews];
    
    [self setupDataSource];
}

- (void)dealloc {
#ifdef DEBUG
    printf("[⚠️] Did released the %s.\n", NSStringFromClass(self.class).UTF8String);
#endif
}




#pragma mark - Overwrite by subclass.

- (void)setupSubViews {

}

- (void)setupDataSource {

}


@end

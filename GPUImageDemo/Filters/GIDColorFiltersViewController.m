//
//  GIDColorFiltersViewController.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "GIDColorFiltersViewController.h"
#import <GPUImage/GPUImage.h>

static NSString * const kImageName = @"pexels-ivan-samkov-6816479.jpg";

@interface GIDColorFiltersViewController ()
// 输入
@property(nonatomic, strong) GPUImagePicture *source;
// 输出
@property(nonatomic, strong) GPUImageView *g_imageView;

//亮度
@property(nonatomic, strong) GPUImageBrightnessFilter *brightnessFilter;
@property(nonatomic, assign) CGFloat brigFilterValue;
//曝光度
@property(nonatomic, strong) GPUImageExposureFilter *exposureFilter;
@property(nonatomic, assign) CGFloat expoFilterValue;

//对比度
@property(nonatomic, strong) GPUImageContrastFilter *contrastFilter;
@property(nonatomic, assign) CGFloat contFilterValue;

//饱和度
@property(nonatomic, strong) GPUImageSaturationFilter *saturationFilter;
@property(nonatomic, assign) CGFloat satuFilterValue;


@property(nonatomic, strong)UIImage *image;

@property(nonatomic, strong)UILabel *valueLabel;
@property(nonatomic, strong)UISlider *slider;

@property(nonatomic, strong) UIButton *brightness;
@property(nonatomic, strong) UIButton *exposure;
@property(nonatomic, strong) UIButton *contrast;
@property(nonatomic, strong) UIButton *saturation;

@property(nonatomic, assign) NSInteger filterIndex;

@end

@implementation GIDColorFiltersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //process
    [self.source processImage];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_brightnessFilter removeAllTargets];
    [_exposureFilter removeAllTargets];
    [_saturationFilter removeAllTargets];
    [_contrastFilter removeAllTargets];
    [_source removeAllTargets];
}

- (void)setupDataSource {
    //初始化filter
    self.brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
    self.exposureFilter = [[GPUImageExposureFilter alloc] init];
    self.contrastFilter = [[GPUImageContrastFilter alloc] init];
    self.saturationFilter = [[GPUImageSaturationFilter alloc] init];
        
    self.brigFilterValue = 0;
    self.expoFilterValue = 0;
    self.contFilterValue = 1;
    self.satuFilterValue = 1;
    
    //读取图片
    self.image = [UIImage imageNamed:kImageName];
    //source
    self.source = [[GPUImagePicture alloc]initWithImage:self.image];
 
    [self.source addTarget:self.brightnessFilter];
    [self.brightnessFilter addTarget:self.exposureFilter];
    [self.exposureFilter addTarget:self.contrastFilter];
    [self.contrastFilter addTarget:self.saturationFilter];
    [self.saturationFilter addTarget:self.g_imageView];
   
    [self buttonAction:self.brightness];
    
}

- (void)setupSubViews {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.brightness = [self buttonWithTitle:@"亮度" action:@selector(buttonAction:)];
    self.exposure = [self buttonWithTitle:@"曝光度" action:@selector(buttonAction:)];
    self.contrast = [self buttonWithTitle:@"对比度" action:@selector(buttonAction:)];
    self.saturation = [self buttonWithTitle:@"饱和度" action:@selector(buttonAction:)];
    
    [self.view addSubview:self.brightness];
    [self.view addSubview:self.exposure];
    [self.view addSubview:self.contrast];
    [self.view addSubview:self.saturation];
    
    [@[self.brightness, self.exposure, self.contrast, self.saturation] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottomMargin);
        make.height.mas_equalTo(80);
    }];
    
    [@[self.brightness, self.exposure, self.contrast, self.saturation] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:15 tailSpacing:15];
    
    
    [self.view addSubview:self.valueLabel];
    [self.view addSubview:self.slider];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.slider.mas_top);
    }];
    
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150);
        make.bottom.mas_equalTo(self.brightness.mas_top).offset(-10);
        make.centerX.mas_equalTo(self.view);
    }];
    
    //GPUImageView
    self.g_imageView = [GPUImageView new];
    self.g_imageView.fillMode = kGPUImageFillModePreserveAspectRatio;
    [self.view addSubview:self.g_imageView];
    [self.g_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_topMargin);
        make.bottom.mas_equalTo(self.valueLabel.mas_top);
    }];
    
    //value
    self.valueLabel.text = @(_slider.value).stringValue;
}

- (void)buttonAction:(UIButton *)sender {
    
    self.brightness.selected = NO;
    self.contrast.selected = NO;
    self.exposure.selected = NO;
    self.saturation.selected = NO;
    
    sender.selected = YES;
    
    //filter
    if ([sender.currentTitle isEqualToString:@"亮度"]) {
        self.filterIndex = 0;
        _slider.value = self.brigFilterValue;
        _slider.minimumValue = -1;
        _slider.maximumValue = 1;
    }
    if ([sender.currentTitle isEqualToString:@"曝光度"]) {
        self.filterIndex = 1;
        _slider.value = self.expoFilterValue;
        _slider.minimumValue = -10;
        _slider.maximumValue = 10;
    }
    if ([sender.currentTitle isEqualToString:@"对比度"]) {
        self.filterIndex = 2;
        _slider.value = self.contFilterValue;
        _slider.minimumValue = 0;
        _slider.maximumValue = 4;
    }
    if ([sender.currentTitle isEqualToString:@"饱和度"]) {
        self.filterIndex = 3;
        _slider.value = self.satuFilterValue;
        _slider.minimumValue = 0;
        _slider.maximumValue = 2;
    }
    
    self.valueLabel.text = [NSString stringWithFormat:@"%.2f",self.slider.value];
    
}

- (void)sliderAction:(UISlider *)sender {
    
    if (self.filterIndex == 0) {
        self.brigFilterValue = sender.value;
        [self.brightnessFilter setBrightness:self.brigFilterValue];
    }
    if (self.filterIndex == 1) {
        self.expoFilterValue = sender.value;
        [self.exposureFilter setExposure:self.expoFilterValue];
    }
    if (self.filterIndex == 2) {
        self.contFilterValue = sender.value;
        [self.contrastFilter setContrast:self.contFilterValue];
    }
    if (self.filterIndex == 3) {
        self.satuFilterValue = sender.value;
        [self.saturationFilter setSaturation:self.satuFilterValue];
    }
    
    NSString *value = [NSString stringWithFormat:@"%.2f",sender.value];
    self.valueLabel.text = value;
    
    [self.source processImage];
}



#pragma mark - Getter

- (UISlider *)slider {
    if (!_slider) {
        _slider = [UISlider new];
        _slider.value = 1;
        _slider.minimumValue = 0;
        _slider.maximumValue = 10;
        [_slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}
- (UILabel *)valueLabel {
    if (!_valueLabel) {
        _valueLabel = [UILabel new];
        _valueLabel.textColor = UIColor.blackColor;
        _valueLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _valueLabel;
}


- (UIButton *)buttonWithTitle:(NSString *)title action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
    
    [button setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}

@end

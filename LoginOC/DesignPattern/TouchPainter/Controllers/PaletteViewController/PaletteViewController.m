//
//  PaletteViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/11.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "PaletteViewController.h"
#import "CommandSlider.h"

/// 适配器，需适配来自RGB滑动条的数值，
@interface PaletteViewController ()
@property (weak, nonatomic) IBOutlet CommandSlider *redSlider;
@property (weak, nonatomic) IBOutlet CommandSlider *greenSlider;
@property (weak, nonatomic) IBOutlet CommandSlider *blueSlider;

@property (weak, nonatomic) IBOutlet UIView *palettView;

@end

@implementation PaletteViewController

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self saveValues];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    SetStrokeColorCommand *colorCommand = (SetStrokeColorCommand *)[self.redSlider command];
    colorCommand.delegate = self;
    
    [self blockAdapter:colorCommand];
    
    [self setDefaultPaletterView];
}

- (void)setDefaultPaletterView {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:@"red"];
    CGFloat greenValue = [userDefaults floatForKey:@"green"];
    CGFloat blueValue = [userDefaults floatForKey:@"blue"];
    CGFloat sizeValue = [userDefaults floatForKey:@"size"];
    
    [self.redSlider setValue:redValue];
    [self.greenSlider setValue:greenValue];
    [self.blueSlider setValue:blueValue];
    
    UIColor *color = [UIColor colorWithRed:redValue
                                     green:greenValue
                                      blue:blueValue
                                     alpha:1.0];
    
    [self.palettView setBackgroundColor:color];
}

#pragma mark - SetStrokeColorCommandDelegate

- (void)command:(nonnull SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(nonnull UIColor *)color {
    [self.palettView setBackgroundColor:color];
}

/// 当客户端 （SetStrokeColorCommand对象）请求新值，调用委托或者适配器的 command：didRequestColorComponentsForRed：green：blue方法时，PaletteViewController 作出响应，把相应d滑动条的值赋值给每个颜色分量，同时也会调用上面的command:didFinishColorUpdateWithColor 方法修改 小调色板 palettView 的背景颜色
- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue {
    *red = self.redSlider.value;
    *green = self.greenSlider.value;
    *blue = self.blueSlider.value;
}

#pragma mark - block 实现适配模式
- (void)blockAdapter:(SetStrokeColorCommand *)setStrokeColorCommand {
    setStrokeColorCommand.RGBValuesProvider = ^(CGFloat * _Nullable red, CGFloat * _Nullable green, CGFloat * _Nullable blue) {
        *red = self.redSlider.value;
        *green = self.greenSlider.value;
        *blue = self.blueSlider.value;
    };
    
    setStrokeColorCommand.postColorUpdateProvider = ^(UIColor * _Nullable color) {
        [self.palettView setBackgroundColor:color];
    };
}

#pragma mark -
#pragma mark - Slider event handler

- (IBAction)onCommandSliderValueChanged:(CommandSlider *)sender {
    
    [[sender command] execute];
}

#pragma mark - Private

/// 保存上次设置的颜色值
- (void)saveValues {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:self.redSlider.value forKey:@"red"];
    [userDefaults setFloat:self.redSlider.value forKey:@"green"];
    [userDefaults setFloat:self.redSlider.value forKey:@"blue"];
    [userDefaults setFloat:self.redSlider.value forKey:@"size"];
}


@end

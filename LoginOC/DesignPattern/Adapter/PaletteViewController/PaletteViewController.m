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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - SetStrokeColorCommandDelegate

- (void)command:(nonnull SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(nonnull UIColor *)color {
    [self.palettView setBackgroundColor:color];
}

/// 当客户端 （SetStrokeColorCommand对象）请求新值，调用委托或者适配器的 command：didRequestColorComponentsForRed：green：blue方法时，PaletteViewController 作出响应，把相应d滑动条的值赋值给每个颜色分量，同时也会调用上面的command:didFinishColorUpdateWithColor 方法修改 小调色板 palettView 的背景颜色
- (void)command:(nonnull SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    red = self.redSlider.value;
    green = self.greenSlider.value;
    blue = self.blueSlider.value;
}


#pragma mark -
#pragma mark - Slider event handler

- (IBAction)onCommandSliderValueChanged:(CommandSlider *)sender {
    
    [[sender command] execute];
}


@end

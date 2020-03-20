//
//  PaletteViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/11.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "PaletteViewController.h"
#import "CommandSlider.h"

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

- (void)command:(nonnull SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    red = self.redSlider.value;
    green = self.greenSlider.value;
    blue = self.blueSlider.value;
}

@end

//
//  LBDropMenuSegmentView.m
//  LoginOC
//
//  Created by yhp on 2018/4/8.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LBDropMenuSegmentView.h"
#import "LBDropMenuView.h"
#import "GrowupResponse.h"
#import "UIColor+Extension.h"

@interface LBDropMenuSegmentView () <LBDropMenuViewDelegate>

@property (nonatomic, strong) NSArray *addressArr;
@property (nonatomic, strong) NSArray *categoriesArr;
@property (nonatomic, strong) NSArray *sortsArr;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) NSMutableArray *dropViewArray;

@end

@implementation LBDropMenuSegmentView


- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.titles = titles;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CGFloat width = ceil([UIScreen mainScreen].bounds.size.width / _titles.count);
    for (NSInteger i = 0; i < self.titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        [self.buttonArray addObject:button];
        button.frame = CGRectMake(i * width, 0, width, 44);
        [button setTitle:self.titles[i] forState:UIControlStateNormal];
        button.titleLabel.font =  [UIFont systemFontOfSize:14];
        button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [button setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"childArrow"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self buttonEdgeInsets:button];
        
        LBDropMenuView *dropview = [[LBDropMenuView alloc] init];
        dropview.arrowView = button.imageView;
        dropview.delegate = self;
        [self.dropViewArray addObject:dropview];
    }
    
    CALayer *separateLayer = [[CALayer alloc] init];
    separateLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    separateLayer.frame = CGRectMake(0, self.bounds.size.height - 1.0 / [UIScreen mainScreen].scale, self.bounds.size.width, 1.0 / [UIScreen mainScreen].scale);
    [self.layer addSublayer:separateLayer];
    
}


- (void)buttonAction:(UIButton *)sender {
    NSArray *tableNum = @[@3, @1, @3];
    
    NSArray *dataArray = @[self.oneListArray,self.twoListArray,self.threeListArray];
    NSInteger index = [self.buttonArray indexOfObject:sender];
    LBDropMenuView *currentDropView = [self.dropViewArray objectAtIndex:index];
    
    [self.dropViewArray enumerateObjectsUsingBlock:^(LBDropMenuView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != index) {
            [obj dismiss];
        }
    }];
    
    [currentDropView creatDropView:self withShowTableNum:[tableNum[index] integerValue] withData:dataArray[index]];
}



-(void)dismissDropMenuView{
    [self.dropViewArray enumerateObjectsUsingBlock:^(LBDropMenuView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj dismiss];
    }];
}


#pragma mark - LBDropMenuViewDelegate
-(void)dropMenuView:(LBDropMenuView *)view didSelectItem:(CourseJsonTreeDataResponse *)objc {
    NSInteger index = [self.dropViewArray indexOfObject:view];
    UIButton *currentButton = [self.buttonArray objectAtIndex:index];
    [currentButton setTitle:objc.name forState:UIControlStateNormal];
    [currentButton setTitleColor:[UIColor colorWithHexString:@"#EF8200"] forState:UIControlStateNormal];
    [self buttonEdgeInsets:currentButton];
    self.selectBlock(objc);
}


-(void)buttonEdgeInsets:(UIButton *)button{
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.imageView.bounds.size.width + 2, 0, button.imageView.bounds.size.width + 10)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width + 10, 0, -button.titleLabel.bounds.size.width + 2)];
}

#pragma mark - 懒加载
- (NSMutableArray *)buttonArray {
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

- (NSMutableArray *)dropViewArray {
    if (!_dropViewArray) {
        _dropViewArray = [NSMutableArray array];
    }
    return _dropViewArray;
}

- (NSMutableArray<CourseFilterResponse *> *)oneListArray {
    if (!_oneListArray) {
        _oneListArray = [NSMutableArray array];
    }
    return _oneListArray;
}

- (NSMutableArray<CourseFilterResponse *> *)twoListArray {
    if (!_twoListArray) {
        _twoListArray = [NSMutableArray array];
    }
    return _twoListArray;
}

- (NSMutableArray<CourseFilterResponse *> *)threeListArray {
    if (!_threeListArray) {
        _threeListArray = [NSMutableArray array];
    }
    return _threeListArray;
}

@end

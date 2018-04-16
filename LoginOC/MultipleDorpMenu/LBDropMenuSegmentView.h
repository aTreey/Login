//
//  LBDropMenuSegmentView.h
//  LoginOC
//
//  Created by liepin on 2018/4/8.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CourseFilterResponse;
@class CourseJsonTreeDataResponse;

typedef void(^SelectItemBlock)(CourseJsonTreeDataResponse *data);
@interface LBDropMenuSegmentView : UIView
@property (nonatomic, copy) SelectItemBlock selectBlock;
@property (nonatomic, strong) NSMutableArray<CourseFilterResponse *> *oneListArray;
@property (nonatomic, strong) NSMutableArray<CourseFilterResponse *> *twoListArray;
@property (nonatomic, strong) NSMutableArray<CourseFilterResponse *> *threeListArray;



- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles;


@end

//
//  GrowupResponse.h
//  ios--app
//
//  Created by iOnRoad on 2017/2/20.
//  Copyright © 2017年 yhp. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CourseJsonTreeDataResponse : NSObject
@property (nonatomic, assign) NSInteger categoryId; //
@property (nonatomic, assign) NSInteger parentId;    // 父节点ID
@property (nonatomic, assign) NSInteger leafFlag;// 是否有叶子结点
@property (nonatomic, assign) NSInteger level;  // 层级
@property (nonatomic, copy) NSString *name;     // 板块名称
@property (nonatomic, assign) NSInteger dataId;

@property (nonatomic, assign) BOOL isSelect;    // 选中
@property (nonatomic, strong) NSMutableArray *oneSelectArray;    // 选中1
@property (nonatomic, strong) NSMutableArray *twoSelectArray;    // 选中2
@property (nonatomic, strong) NSMutableArray *threSelectArray;    // 选中3


@end

@interface CourseFilterResponse : NSObject
@property (nonatomic, assign) BOOL isSelect;    // 选中

@property (nonatomic, assign) NSInteger parentId;    // 父节点ID
@property (nonatomic, strong) NSArray *childs;     // 板块名称
@property (nonatomic, assign) NSInteger level;  // 层级
@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, strong) CourseJsonTreeDataResponse *data;
@end


@interface CourseJsonTreeResponse : NSObject
@property (nonatomic, strong) CourseFilterResponse *root;
@end

@interface GetCourseFilterListResponse : NSObject
@property (nonatomic, strong) CourseJsonTreeResponse *treeJson;
@end







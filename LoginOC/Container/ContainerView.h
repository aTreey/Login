//
//  ContainerView.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/7.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerTypes.h"
#import "ContainerDefines.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ContainerViewDelegate <NSObject>
@optional
- (void)changeContainerMove:(ContainerMoveType)containerMove containerY:(CGFloat)containerY animated:(BOOL)animated;
@end


@interface ContainerView : UIView

@property (nonatomic, weak) id<ContainerViewDelegate> delegate;



@property (nonatomic) BOOL portrait;

@property (nonatomic) BOOL firstAddedTop;
@property (nonatomic) BOOL firstAddedMiddle;
@property (nonatomic) BOOL firstAddedBottom;

- (CGFloat)getContainerBottom;
- (CGFloat)getContainerMiddle;

@property (strong, nonatomic) UIView *headerView;

@property (nonatomic) BOOL containerBottomButtonToMoveTop;

@property (nonatomic) BOOL containerAllowMiddlePosition;

@property (nonatomic) BOOL containerShadow;

@property (nonatomic) CGFloat containerTop;

@property (nonatomic) CGFloat containerMiddle;

@property (nonatomic) CGFloat containerBottom;

@property (nonatomic) CGFloat containerCornerRadius;

@property (nonatomic) ContainerMoveType containerPosition;

@property (nonatomic) ContainerStyle containerStyle;

- (void)containerMoveForVelocityInView:(CGFloat)velocityInViewY;

- (void)containerMove:(ContainerMoveType)moveType;
- (void)containerMove:(ContainerMoveType)moveType animated:(BOOL)animated;
- (void)containerMove:(ContainerMoveType)moveType animated:(BOOL)animated completion:(void (^)(void))completion;


- (void)containerMoveCustomPosition:(CGFloat)position moveType:(ContainerMoveType)moveType;
- (void)containerMoveCustomPosition:(CGFloat)position moveType:(ContainerMoveType)moveType animated:(BOOL)animated;
- (void)containerMoveCustomPosition:(CGFloat)position moveType:(ContainerMoveType)moveType animated:(BOOL)animated completion:(void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END

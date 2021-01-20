//
//  ContainerViewController.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/7.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerView.h"


NS_ASSUME_NONNULL_BEGIN

@interface ContainerViewController : UIViewController

@property (strong, nonatomic) UIView            *bottomView;
@property (strong, nonatomic) UIButton          *shadowButton;
@property (strong, nonatomic) ContainerView     *containerView;

@property (nonatomic, weak) id<ContainerViewDelegate> delegate;


/**
 @brief This view sets a custom header for the container.
 */
@property (strong, nonatomic) UIView *headerView;

/// 当前位置
@property (nonatomic, readonly) ContainerMoveType containerPosition;

///
@property (nonatomic) ContainerStyle containerStyle;

/**
 @brief This parameter for changing the rounding radius
 */
@property (nonatomic) CGFloat containerCornerRadius;

/**
 @brief When moving the container, by default there are 2 positions (this is moving up and down). This parameter adds 3 position (move to the middle)
 */
@property (nonatomic) BOOL containerAllowMiddlePosition;



/**
 @brief This parameter indicates whether to add a button when the container is at the bottom to animate the container upwards.
 */
@property (nonatomic) BOOL containerBottomButtonToMoveTop;


/**
 @brief This parameter sets the shadow under container
 */
@property (nonatomic) BOOL containerShadowView;

/**
 @brief This parameter sets the shadow in container
 */
@property (nonatomic) BOOL containerShadow;


/**
 @brief This parameter allows you to zoom in on the screen under ContainerView.
 */
@property (nonatomic) BOOL containerZoom;

/**
 @brief This parameter sets the new position value for the up move type.
 */
@property (nonatomic) CGFloat containerTop;

/**
 @brief This parameter sets the new position value for the type of movement to the middle position.
 */
@property (nonatomic) CGFloat containerMiddle;

/**
 @brief This parameter sets the new position value for the type of movement to the middle position.
 */
@property (nonatomic) CGFloat containerBottom;


/**
 @brief This method for animated container movement, at fixed positions
  
 @param moveType There are 4 types of movement. Moving 1) up, 2) middle, 3) down, 4) hiding in the most down beyond the limits of visibility
 */
- (void)containerMove:(ContainerMoveType)moveType;
- (void)containerMove:(ContainerMoveType)moveType animated:(BOOL)animated;
- (void)containerMove:(ContainerMoveType)moveType animated:(BOOL)animated completion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END

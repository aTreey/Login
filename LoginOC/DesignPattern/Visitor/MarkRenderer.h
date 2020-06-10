//
//  MarkRenderer.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/6/10.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkRenderer : NSObject <MarkVisitor>

@property (nonatomic, assign) BOOL shouldMoveContextToDot;

@property (nonatomic, assign) CGContextRef context;

- (id)initWithCGContext:(CGContextRef)context;

- (void)visitMark:(id <Mark>)mark;
- (void)visitDot:(Dot *)dot;
- (void)visitVertex:(Vertex *)vertex;
- (void)visitStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END

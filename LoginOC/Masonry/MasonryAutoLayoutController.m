//
//  MasonryAutoLayoutController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/27.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "MasonryAutoLayoutController.h"

@interface MasonryAutoLayoutController ()

@property (nonatomic, strong) Class viewClass;

@end

@implementation MasonryAutoLayoutController

- (id)initWithTitle:(NSString *)title viewClass:(Class)viewClass {
    self = [super init];
    if (!self) return nil;
    
    self.title = title;
    self.viewClass = viewClass;
    
    return self;
}

- (void)loadView {
    self.view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.viewClass) owner:self options:nil] firstObject];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  CoordinatingController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/10.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "CoordinatingController.h"
#import "PaletteViewController.h"

@interface CoordinatingController ()

@property (nonatomic, readwrite) CanvasViewController *canvasViewController;
@property (nonatomic, readwrite) UIViewController *activeViewController;

@end

@implementation CoordinatingController

static CoordinatingController *sharedCoordinator = nil;

- (void) initialize
{
    self.canvasViewController = [[CanvasViewController alloc] init];
    self.activeViewController = self.canvasViewController;
}

+ (CoordinatingController *) sharedInstance
{
  if (sharedCoordinator == nil)
  {
    sharedCoordinator = [[super allocWithZone:NULL] init];
    
    // initialize the first view controller
    // and keep it with the singleton
    [sharedCoordinator initialize];
  }
  
  return sharedCoordinator;
}


#pragma mark - 切换控制器方法

- (IBAction)requectViewChangeByObject:(id)sender {
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        switch ([(UIBarButtonItem *)sender tag]) {
            case kButtonTagOpenPaletteView:
            {
                PaletteViewController *controller = [PaletteViewController new];
                [self.canvasViewController presentViewController:controller animated:YES completion:nil];
                self.activeViewController = controller;
            }
                break;
                
            case kButtonTagOpenThumbnailView:
            {
                PaletteViewController *controller = [PaletteViewController new];
                [self.canvasViewController presentViewController:controller animated:YES completion:nil];
                self.activeViewController = controller;
            }
                break;
            default:
            {
                [self.canvasViewController dismissViewControllerAnimated:YES completion:nil];
                self.activeViewController = self.canvasViewController;
            }
                break;
        }
    }
    
    else {
        [self.canvasViewController dismissViewControllerAnimated:YES completion:nil];
        self.activeViewController = self.canvasViewController;
    }
}


@end

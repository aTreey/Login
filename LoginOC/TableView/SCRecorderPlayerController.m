//
//  SCRecorderPlayerController.m
//  LoginOC
//
//  Created by HongpengYu on 2019/2/20.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "SCRecorderPlayerController.h"


@interface SCRecorderPlayerController ()
@property (strong, nonatomic) SCAssetExportSession *exportSession;
@property (strong, nonatomic) SCPlayer *player;
@end

@implementation SCRecorderPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _player = [SCPlayer player];
    _player.loopEnabled = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_player setItemByAsset:_recordSession.assetRepresentingSegments];
    [_player play];
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

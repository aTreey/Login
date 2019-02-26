//
//  SCRecorderController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/10/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "SCRecorderController.h"
#import <SCRecorder/SCRecorder.h>
#import "SCRecordSessionManager.h"
#import "SCRecorderPlayerController.h"

@interface SCRecorderController ()<SCRecorderDelegate>
@property (nonatomic, strong) SCRecorder *recorder;
@property (nonatomic, strong) SCRecordSession *recordSession;

@property (strong, nonatomic) UIView *previewView;
@property (strong, nonatomic) UIButton *recordButton;
@property (strong, nonatomic) UIButton *cancelRecordButton;
@property (strong, nonatomic) SCRecorderToolsView *focusView;
@end

@implementation SCRecorderController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor darkGrayColor];
//
//    [self setupUI];
//
//    self.previewView = [[UIView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.previewView];
//
//    _recorder = [SCRecorder recorder];
//    _recorder.captureSessionPreset = [SCRecorderTools bestCaptureSessionPresetCompatibleWithAllDevices];
//    _recorder.previewView = _previewView;
//    _recorder.delegate = self;
//    [self prepareSession];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    _recorder = [SCRecorder recorder];
    _recorder.captureSessionPreset = [SCRecorderTools bestCaptureSessionPresetCompatibleWithAllDevices];
    //    _recorder.maxRecordDuration = CMTimeMake(10, 1);
    //    _recorder.fastRecordMethodEnabled = YES;
    
    _recorder.delegate = self;
    _recorder.autoSetVideoOrientation = NO; //YES causes bad orientation for video from camera roll
    
    UIView *previewView = self.previewView;
    _recorder.previewView = previewView;
    
    self.focusView = [[SCRecorderToolsView alloc] initWithFrame:previewView.bounds];
    self.focusView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    self.focusView.recorder = _recorder;
    [previewView addSubview:self.focusView];
    
    self.focusView.outsideFocusTargetImage = [UIImage imageNamed:@"capture_flip"];
    self.focusView.insideFocusTargetImage = [UIImage imageNamed:@"capture_flip"];
    
    _recorder.initializeSessionLazily = NO;
    
    NSError *error;
    if (![_recorder prepare:&error]) {
        NSLog(@"Prepare error: %@", error.localizedDescription);
    }
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_recorder startRunning];
}

- (void)setupUI {
    self.recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.recordButton.frame = CGRectMake(0, 0, 40, 40);
    self.recordButton.backgroundColor = [UIColor cyanColor];
    [self.recordButton setTitle:@"录制" forState:UIControlStateNormal];
    
    [self.recordButton addTarget:self action:@selector(recordButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.cancelRecordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelRecordButton.frame = CGRectMake(0, 0, 40, 40);
    self.cancelRecordButton.backgroundColor = [UIColor greenColor];
    [self.cancelRecordButton addTarget:self action:@selector(cancelRecordButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelRecordButton setTitle:@"暂停" forState:UIControlStateNormal];
    
    UIBarButtonItem *record = [[UIBarButtonItem alloc] initWithCustomView:self.recordButton];
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc] initWithCustomView:self.cancelRecordButton];
    
    self.navigationItem.rightBarButtonItems = @[record, cancle];
    
}


- (void)prepareSession {
    if (_recorder.session == nil) {
        
        SCRecordSession *session = [SCRecordSession recordSession];
        session.fileType = AVFileTypeQuickTimeMovie;
        
        _recorder.session = session;
    }
}


- (void)saveAndShowSession:(SCRecordSession *)recordSession {
    [[SCRecordSessionManager sharedInstance] saveRecordSession:recordSession];
    
    _recordSession = recordSession;
    SCRecorderPlayerController *playController = [SCRecorderPlayerController new];
    playController.recordSession = recordSession;
    [self.navigationController pushViewController:playController animated:true];
}


- (void)recordButtonAction {
    [_recorder record];
}


- (void)cancelRecordButtonAction {
    [_recorder pause:^{
        [self saveAndShowSession:_recorder.session];
    }];
}


- (void)recorder:(SCRecorder *)recorder didCompleteSession:(SCRecordSession *)recordSession {
    NSLog(@"didCompleteSession:");
}

- (void)recorder:(SCRecorder *)recorder didInitializeAudioInSession:(SCRecordSession *)recordSession error:(NSError *)error {
    if (error == nil) {
        NSLog(@"Initialized audio in record session");
    } else {
        NSLog(@"Failed to initialize audio in record session: %@", error.localizedDescription);
    }
}

- (void)recorder:(SCRecorder *)recorder didInitializeVideoInSession:(SCRecordSession *)recordSession error:(NSError *)error {
    if (error == nil) {
        NSLog(@"Initialized video in record session");
    } else {
        NSLog(@"Failed to initialize video in record session: %@", error.localizedDescription);
    }
}

- (void)recorder:(SCRecorder *)recorder didBeginSegmentInSession:(SCRecordSession *)recordSession error:(NSError *)error {
    NSLog(@"Began record segment: %@", error);
}

- (void)recorder:(SCRecorder *)recorder didCompleteSegment:(SCRecordSessionSegment *)segment inSession:(SCRecordSession *)recordSession error:(NSError *)error {
    NSLog(@"Completed record segment at %@: %@ (frameRate: %f)", segment.url, error, segment.frameRate);
    
    [recordSession.outputUrl saveToCameraRollWithCompletion:^(NSString * _Nullable path, NSError * _Nullable error) {
        if (error == nil) {
            NSLog(@"保存成功");
        }
        
    }];
}


- (void)recorder:(SCRecorder *)recorder didAppendVideoSampleBufferInSession:(SCRecordSession *)recordSession {
    
//    [[SCRecordSessionManager sharedInstance] saveRecordSession:recordSession];
//    _recordSession = recordSession;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

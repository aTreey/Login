//
//  CHJBaseChatViewController.m
//  LoginOC
//
//  Created by YuHongpeng on 2019/6/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "CHJBaseChatViewController.h"


@interface CHJBaseChatViewController ()

@end

@implementation CHJBaseChatViewController

- (void)dealloc {
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
    self.tableView = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Publick

- (void)loadDataSource {
    // subClass
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //view在导航栏下方
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self addNotification];
    
    [self initUI];
}

- (void)initUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // in subClass
    return nil;
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)applicationDidBecomeActive:(NSNotification*)note {
    
}

- (void)applicationWillResignActive:(NSNotification*)note {
    
}


#pragma mark - Lazy

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        if (self.tableViewStyle == UITableViewStyleGrouped) {
            UIView *backgroundView = [[UIView alloc] initWithFrame:tableView.bounds];
            backgroundView.backgroundColor = tableView.backgroundColor;
            tableView.backgroundView = backgroundView;
        }
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}

@end

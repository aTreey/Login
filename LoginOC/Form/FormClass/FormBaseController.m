//
//  FormBaseController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/19.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "FormBaseController.h"
#import "FormRow.h"

@interface FormBaseController ()

@end

@implementation FormBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self normalSetup];
    [self configureSubview];
    [self.view updateConstraintsIfNeeded];
}

- (void)updateViewConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [super updateViewConstraints];
}

#pragma mark - protocol
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormRow *row = self.form.rowArray[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.reuseIdentifier];
    if (row.rowConfigBlock) {
        row.rowConfigBlock(cell, row.value, indexPath);
    }
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView
        heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormRow *row = [self.form.rowArray objectAtIndex:indexPath.row];
    return row.rowHeight == 0 ? UITableViewAutomaticDimension : row.rowHeight;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.form.rowArray.count;
}

- (void)tableView:(UITableView *)tableView
         didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - private methods
// 初始化控制器的一些初始参数、状态等
- (void)normalSetup
{
    self.view.backgroundColor = [UIColor whiteColor];
}

// 配置视图
- (void)configureSubview
{
    [self.view addSubview:self.tableView];
}


#pragma mark - getters/setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 88.f;
    }
    
    return _tableView;
}

- (Form *)form {
    if (!_form) {
        _form = [[Form alloc] init];
    }
    return _form;
}

@end

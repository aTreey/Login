//
//  FormViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/19.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "FormViewController.h"
#import "FormCell_0.h"
#import "FormCell_1.h"
#import "FormCell_2.h"

@implementation FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCells];
    [self setupRow];
}

- (void)registerCells {
    [self.tableView registerClass:[FormCell_0 class] forCellReuseIdentifier:NSStringFromClass([FormCell_0 class])];
    [self.tableView registerClass:[FormCell_1 class] forCellReuseIdentifier:NSStringFromClass([FormCell_1 class])];
    [self.tableView registerClass:[FormCell_2 class] forCellReuseIdentifier:NSStringFromClass([FormCell_2 class])];
}

- (void)setupRow {
    Class cell_0 = [FormCell_0 class];
    FormRow *row0 = [[FormRow alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(cell_0)];
    row0.cellClass = [FormCell_0 class];
    row0.rowHeight = 60;
    row0.hidden = NO;
    row0.noValueDisplayText = @"请选择0";
    
    Class cell_1 = [FormCell_1 class];
    FormRow *row1 = [[FormRow alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(cell_1)];
    row0.cellClass = cell_1;
    row0.rowHeight = 60;
    row0.hidden = NO;
    row0.noValueDisplayText = @"请选择1";
    
    Class cell_2 = [FormCell_2 class];
    FormRow *row2 = [[FormRow alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(cell_2)];
    row2.cellClass = cell_2;
    row2.rowHeight = 60;
    row2.hidden = NO;
    row2.noValueDisplayText = @"请选择2";
    
    [self.form addRow:row0];
    [self.form addRow:row1];
    [self.form addRow:row2];
}


@end

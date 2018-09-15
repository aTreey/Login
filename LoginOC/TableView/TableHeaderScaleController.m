//
//  TableHeaderScaleController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/13.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "TableHeaderScaleController.h"
#import "Masonry.h"


@interface TableHeaderScaleController ()

@end

@implementation TableHeaderScaleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self setupTableHeaderView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}


- (void)setupTableHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
    headerView.backgroundColor = [UIColor greenColor];
    self.tableView.tableHeaderView = headerView;
    
    UIView *bgiew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
    headerView.backgroundColor = [UIColor orangeColor];
    bgiew.tag = 1000;
//    [headerView addSubview:bgiew];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
    img.tag = 2000;
    img.contentMode = UIViewContentModeScaleAspectFill;
    img.image = [UIImage imageNamed:@"defaultAppIcon"];
    
    [headerView addSubview:img];
    
//    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.tableView.mas_top);
//        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
//    }];
//
//    [self.tableView beginUpdates];
//    [self.tableView setTableFooterView:headerView];
//    [self.tableView endUpdates];
//
//    [self.tableView setNeedsLayout];
//    [self.tableView layoutIfNeeded];
//
//    CGSize size = [headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    CGRect headerFrame = headerView.frame;
//    headerFrame.size.height = size.height;
//    headerView.frame = headerFrame;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"section: %ld-row: %ld", indexPath.section, indexPath.row];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset < 0) {//下拉
//        UIView *bgView = [self.tableView.tableHeaderView viewWithTag:1000];
//        bgView.frame = CGRectMake(0, yOffset, [UIScreen mainScreen].bounds.size.width, 160 - yOffset);
        
        UIImageView *imgView = (UIImageView *)[self.tableView.tableHeaderView viewWithTag:2000];
        
        imgView.frame = CGRectMake(0, yOffset, [UIScreen mainScreen].bounds.size.width, 160 - yOffset);
    }
}


@end

//
//  JsutPostedFlickrPhotosController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/25.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "JsutPostedFlickrPhotosController.h"

@interface JsutPostedFlickrPhotosController ()

@end

@implementation JsutPostedFlickrPhotosController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchPhotos];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

#pragma mark - Setter

- (void)fetchPhotos {
    self.photos = nil;
}

@end

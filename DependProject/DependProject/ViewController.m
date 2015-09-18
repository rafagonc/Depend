//
//  ViewController.m
//  DependProject
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonzalves. All rights reserved.
//

#import "ViewController.h"
#import "DPDatasourceProtocol.h"

@interface ViewController ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (setter=injected:, readonly) id<DPDatasourceProtocol> datasource;

//change contexts
//@property (setter=injected_second:, readonly) id<DPDatasourceProtocol> datasource;

@end

@implementation ViewController

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self.datasource;
    self.tableView.delegate = self.datasource;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    [self.navigationItem setRightBarButtonItem:item];
    
}

#pragma mark - actions
-(void)done:(UIBarButtonItem *)item {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - dealloc
-(void)dealloc {
    NSLog(@"%@ - DEALLOC", NSStringFromClass(self.class));
}

@end

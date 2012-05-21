//
//  PullToRefreshTable.m
//  BAMEasyTableDemo
//
//  Created by Macbook Pro on 5/21/12.
//  Copyright (c) 2012 Barry Murphy. All rights reserved.
//

#import "PullToRefreshTable.h"
#import "SVPullToRefresh.h"

@implementation PullToRefreshTable

#pragma mark - View Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup the pull-to-refresh view
    [self.tableView addPullToRefreshWithActionHandler:^{
        NSLog(@"refresh dataSource");
        [self.tableView.pullToRefreshView performSelector:@selector(stopAnimating) withObject:nil afterDelay:2];
    }];
    
    // trigger the refresh manually at the end of viewDidLoad
    [self.tableView.pullToRefreshView triggerRefresh];
    
    
    // you can also display the "last updated" date
    self.tableView.pullToRefreshView.lastUpdatedDate = [NSDate date];
    
    // you can configure how that date is displayed
    // NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // dateFormatter.dateStyle = NSDateFormatterLongStyle;
    // dateFormatter.timeStyle = NSDateFormatterNoStyle;
    // tableView.pullToRefreshView.dateFormatter = dateFormatter;
}

@end

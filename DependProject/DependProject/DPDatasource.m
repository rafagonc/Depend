//
//  DPDatasource.m
//  DependProject
//
//  Created by Rafael Gonzalves on 9/18/15.
//  Copyright (c) 2015 Rafael Gonzalves. All rights reserved.
//

#import "DPDatasource.h"

@implementation DPDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"CellIndentification";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = @"Enjoy loosely coupled architeture";
    
    return cell;
}

@end

//
//  SQTrainingDateListViewController.m
//  SQFitnessProgram
//
//  Created by 朱双泉 on 2018/12/30.
//  Copyright © 2018 Castie!. All rights reserved.
//

#import "SQTrainingDateListViewController.h"
#import "SQTrainingDateListViewEventHandler.h"
#import "SQTrainingDateListDataSource.h"

@interface SQTrainingDateListViewController ()

@end

@implementation SQTrainingDateListViewController

- (void)setupUI {
    self.title = @"Training Date";
    [self setupTableView];
}

- (void)setupTableView {
    NSArray *dataSource = [(id<SQTrainingDateListDataSource>)self.viewDataSource fetchDataSourceFromDB];
    [self setupDataSource:dataSource loadCell:^UITableViewCell *(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return [tableView dequeueReusableCellWithIdentifier:@"TrainingDate" forIndexPath:indexPath];
    } loadCellHeight:^CGFloat(id  _Nonnull model) {
        return 44;
    } bind:^(UITableViewCell * _Nonnull cell, id  _Nonnull model) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", model];
    }];
}

- (IBAction)addTraningDate:(UIBarButtonItem *)sender {
    [(id<SQTrainingDateListViewEventHandler>)self.eventHandler didTouchNavigationBarAddButton];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [(id<SQTrainingDateListViewEventHandler>)self.eventHandler handleDidSelectRowAtIndexPath:indexPath];
}

@end

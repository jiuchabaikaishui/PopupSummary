//
//  ViewController.m
//  PopupSummary
//
//  Created by 綦 on 16/10/20.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import "ViewController.h"
#import "SectionModel.h"
#import "InfoViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArr;

@end

@implementation ViewController

#pragma mark - 属性方法
- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray arrayWithCapacity:1];
        __weak typeof(self) weakSelf = self;
        NSArray *arr = @[@{@"title":@"UIPopoverController:只能使用于iPad，在iPhone中奔溃！"}, @{@"items":@[
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"UIPopoverController", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(44, 0, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            popViewController.backgroundColor = [UIColor redColor];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 44, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 44, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 0, 44);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(44, 44, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 44, 44);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"UIPopoverController", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            NSLog(@"%@", NSStringFromCGRect(cell.bounds));
                                                            [popViewController presentPopoverFromRect:cell.bounds inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 44, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 44, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 0, 44);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(44, 44, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 44, 44);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"UIPopoverController", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(44, 0, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 44, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 44, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 0, 44);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(44, 44, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 44, 44);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"UIPopoverController", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(44, 0, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 44, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 44, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 0, 44);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(44, 44, 0, 0);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}},
                                                        @{@"title":@"UIPopoverController", @"subTitle":@"", @"option":^{
                                                            InfoViewController *infoViewController = [[InfoViewController alloc] init];
                                                            UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                                            //popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                                            CGRect rect = CGRectMake(0, 0, 44, 44);
                                                            NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                                            [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];}}
                                                        ]}
                         ];
        
        SectionModel *sectionModel;
        for (NSDictionary *sectionDic in arr) {
            sectionModel = [SectionModel sectionModelWithDic:sectionDic];
            [_dataArr addObject:sectionModel];
        }
    }
    
    return _dataArr;
}

#pragma mark - 控制器周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingUi];
}

#pragma mark - 自定义方法
- (void)settingUi
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SectionModel *sectionModel = self.dataArr[section];
    
    return sectionModel.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    SectionModel *sectionModel = self.dataArr[indexPath.section];
    ItemModel *itemModel = sectionModel.items[indexPath.row];
    cell.textLabel.text = itemModel.title;
    cell.detailTextLabel.text = itemModel.subTitle;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SectionModel *sectionModel = self.dataArr[indexPath.section];
    ItemModel *itemModel = sectionModel.items[indexPath.row];
    if (itemModel.option) {
        itemModel.option();
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SectionModel *sectionModel = self.dataArr[section];
    
    return sectionModel.title;
}

@end

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

#define RandomColor                 [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0]

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArr;

@end

@implementation ViewController

#pragma mark - 属性方法
- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray arrayWithCapacity:1];
        __weak typeof(self) weakSelf = self;
        NSArray *arr = @[@{@"title":@"UIPopoverController:iOS9中被弃用，只能使用于iPad，在iPhone中奔溃！"}, @{@"items":@[
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
- (void)rightBarButtonAction:(UIBarButtonItem *)sender
{
    InfoViewController *infoViewController = [[InfoViewController alloc] init];
    UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
    popViewController.popoverContentSize = CGSizeMake(200, 100); //弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
    [popViewController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

#pragma mark - 控制器周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingUi];
}

#pragma mark - 自定义方法
- (void)settingUi
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
- (UIImage *)resizableImage:(UIImage *)image
{
    CGFloat imageW = image.size.width/2;
    CGFloat imageH = image.size.height/2;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW)];
}
- (UIImage *)imageFromColor:(UIColor *)color andFrame:(CGRect)frame
{
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, frame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
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
    
    cell.imageView.image = [self resizableImage:[self imageFromColor:RandomColor andFrame:CGRectMake(0, 0, 100, 100)]];
    cell.textLabel.backgroundColor = RandomColor;
    cell.detailTextLabel.backgroundColor = RandomColor;
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

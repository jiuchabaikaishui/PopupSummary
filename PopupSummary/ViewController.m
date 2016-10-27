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

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArr;
@property (strong, nonatomic) UIPopoverController *popoverController;

@end

@implementation ViewController

#pragma mark - 属性方法
- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray arrayWithCapacity:1];
        __weak typeof(self) weakSelf = self;
        NSArray *arr = @[@{@"title":@"UIPopoverController:iOS9中被弃用，只能使用于iPad，在iPhone中奔溃！"}, @{@"items":@[
                            @{@"title":@"UIPopoverController", @"subTitle":@"从UIView弹出", @"option":^{
                                //新建一个内容控制器
                                InfoViewController *infoViewController = [InfoViewController infoViewController];
                                UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                weakSelf.popoverController = popViewController;
                                
                                //设置弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                popViewController.popoverContentSize = CGSizeMake(200, 100);
                                //设置弹出窗口的参考位置
                                CGRect rect = CGRectMake(0, 0, 0, 0);
                                NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                /*
                                 UIPopoverArrowDirection:箭头方向
                                 */
                                [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}},
                            @{@"title":@"UIPopoverController", @"subTitle":@"从UIBarButtonItem弹出", @"option":^{
                                //新建一个内容控制器
                                InfoViewController *infoViewController = [InfoViewController infoViewController];
                                UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                weakSelf.popoverController = popViewController;
                                
                                //用于任何容器布局子控制器，弹出窗口的原始大小来自视图控制器的此属性，如果设置了此属性那么UIPopoverController的popoverContentSize属性会失效。
                                infoViewController.preferredContentSize = CGSizeMake(200, 200);
                                
                                //设置弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                popViewController.popoverContentSize = CGSizeMake(200, 100);
                                /*
                                 UIPopoverArrowDirection:箭头方向
                                 */
                                [popViewController presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];}},
                            @{@"title":@"UIPopoverController", @"subTitle":@"预留可编辑控件为此cell", @"option":^{
                                //判断是否弹出控制器
                                if (weakSelf.popoverController.isPopoverVisible) {
                                    [weakSelf.popoverController dismissPopoverAnimated:YES];
                                }
                                else
                                {
                                    InfoViewController *infoViewController = [InfoViewController infoViewController];
                                    UIPopoverController *popViewController = [[UIPopoverController alloc] initWithContentViewController:infoViewController];
                                    weakSelf.popoverController = popViewController;
                                    //设置弹出窗口大小，如果屏幕画不下，会挤小的。这个值默认是320x1100
                                    //popViewController.popoverContentSize = CGSizeMake(200, 100);
                                    //设置弹出窗口的参考位置
                                    CGRect rect = CGRectMake(0, 0, 0, 0);
                                    NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                    UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                    //设置可交互的预留控件
                                    popViewController.passthroughViews = @[cell];
                                    /*
                                     UIPopoverArrowDirection:箭头方向
                                     */
                                    [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
                                }}}
                            ]},
                         @{@"title":@"UIPopoverPresentationController:iOS8中提供，能用于iPad、iPhone中"}, @{@"items":@[
                              @{@"title":@"UIPopoverPresentationController", @"subTitle":@"从UIView弹出", @"option":^{
                                  //新建一个内容控制器
                                  InfoViewController *infoViewController = [InfoViewController infoViewController];
                                  
                                  //用于任何容器布局子控制器，弹出窗口的原始大小来自视图控制器的此属性，如果设置了此属性那么UIPopoverController的popoverContentSize属性会失效。
                                  infoViewController.preferredContentSize = CGSizeMake(200, 200);
                                  //设置模态视图弹出的样式
                                  [infoViewController setModalPresentationStyle:UIModalPresentationPopover];
                                  
                                  //取出点击的cell
                                  NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                  UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                  
                                  //UIPopoverPresentationController是UIViewController实例的属性，不需要创建，获取就可以啦
                                  UIPopoverPresentationController *presentationCtr = infoViewController.popoverPresentationController;
                                  //设置弹出窗口所依附的控件
                                  presentationCtr.sourceView = cell;
                                  //设置弹出窗口对所依附的控件的参考位置
                                  presentationCtr.sourceRect = CGRectMake(10, 10, 20, 20);
                                  //设置箭头方向
                                  presentationCtr.permittedArrowDirections = UIPopoverArrowDirectionLeft;
                                  //设置代理
                                  presentationCtr.delegate = weakSelf;
                                  
                                  //弹出模态视图
                                  [weakSelf presentViewController:infoViewController animated:YES completion:nil];
                              }},
                              @{@"title":@"UIPopoverPresentationController", @"subTitle":@"从UIBarButtonItem弹出", @"option":^{
                                  //新建一个内容控制器
                                  InfoViewController *infoViewController = [InfoViewController infoViewController];
                                  
                                  //用于任何容器布局子控制器，弹出窗口的原始大小来自视图控制器的此属性，如果设置了此属性那么UIPopoverController的popoverContentSize属性会失效。
                                  infoViewController.preferredContentSize = CGSizeMake(200, 200);
                                  //设置模态视图弹出的样式
                                  [infoViewController setModalPresentationStyle:UIModalPresentationPopover];
                                  
                                  //UIPopoverPresentationController是UIViewController实例的属性，不需要创建，获取就可以啦
                                  UIPopoverPresentationController *presentationCtr = infoViewController.popoverPresentationController;
                                  //设置所依附的UIBarButtonItem
                                  presentationCtr.barButtonItem = weakSelf.navigationItem.rightBarButtonItem;
                                  //设置箭头方向
                                  presentationCtr.permittedArrowDirections = UIPopoverArrowDirectionUp;
                                  //设置代理
                                  presentationCtr.delegate = weakSelf;
                                  
                                  //弹出模态视图
                                  [weakSelf presentViewController:infoViewController animated:YES completion:nil];
                              }},
                              @{@"title":@"UIPopoverPresentationController", @"subTitle":@"预留可编辑控件为此cell", @"option":^{
                                  if (weakSelf.presentedViewController) {
                                      [weakSelf dismissViewControllerAnimated:YES completion:nil];
                                  }
                                  else
                                  {
                                      //新建一个内容控制器
                                      InfoViewController *infoViewController = [InfoViewController infoViewController];
                                      
                                      //用于任何容器布局子控制器，弹出窗口的原始大小来自视图控制器的此属性，如果设置了此属性那么UIPopoverController的popoverContentSize属性会失效。
                                      infoViewController.preferredContentSize = CGSizeMake(200, 200);
                                      //设置模态视图弹出的样式
                                      [infoViewController setModalPresentationStyle:UIModalPresentationPopover];
                                      
                                      //UIPopoverPresentationController是UIViewController实例的属性，不需要创建，获取就可以啦
                                      UIPopoverPresentationController *presentationCtr = infoViewController.popoverPresentationController;
                                      //设置所依附的UIBarButtonItem
                                      presentationCtr.barButtonItem = weakSelf.navigationItem.rightBarButtonItem;
                                      //设置箭头方向
                                      presentationCtr.permittedArrowDirections = UIPopoverArrowDirectionUp;
                                      //设置代理
                                      presentationCtr.delegate = weakSelf;
                                      
                                      //取出点击的cell
                                      NSIndexPath *indexPath = [weakSelf.tableView indexPathForSelectedRow];
                                      UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                                      
                                      //设置可交互的预留控件
                                      presentationCtr.passthroughViews = @[cell];
                                      
                                      //弹出模态视图
                                      [weakSelf presentViewController:infoViewController animated:YES completion:nil];
                                  }
                              }}
                              ]},
                         @{@"title":@"UIPopoverPresentationController:iOS8中提供，能用于iPad、iPhone中"}, @{@"items":@[
                               @{@"title":@"UIPopoverPresentationController", @"subTitle":@"从UIView弹出", @"option":^{
                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录" message:@"请输入账号和密码！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
                               }}
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionModel *sectionModel = self.dataArr[section];
    CGSize size = [sectionModel.title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 16, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, size.height)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, [UIScreen mainScreen].bounds.size.width - 16, size.height + 16)];
    label.text = sectionModel.title;
    label.font = [UIFont systemFontOfSize:15];
    label.numberOfLines = 0;
    [view addSubview:label];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    SectionModel *sectionModel = self.dataArr[section];
    CGSize size = [sectionModel.title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 16, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    return size.height + 16;
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

#pragma mark - <UIPopoverPresentationControllerDelegate>代理方法
- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController
{
    NSLog(@"%s", __FUNCTION__);
}
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    NSLog(@"%s", __FUNCTION__);
}
- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView *__autoreleasing  _Nonnull *)view
{
    NSLog(@"%s", __FUNCTION__);
}

@end

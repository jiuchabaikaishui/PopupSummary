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
//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate, UIAlertViewDelegate, UIActionSheetDelegate>
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
                                    if (IS_IPHONE) {
                                        [weakSelf showAlertMessage:@"UIPopoverController只能在ipad中使用！"];
                                    }
                                    else
                                    {
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
                                        [popViewController presentPopoverFromRect:rect inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
                                    }
                                }
                              },
                            @{@"title":@"UIPopoverController", @"subTitle":@"从UIBarButtonItem弹出", @"option":^{
                                    if (IS_IPHONE) {
                                        [weakSelf showAlertMessage:@"UIPopoverController只能在ipad中使用！"];
                                    }
                                    else
                                    {
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
                                        [popViewController presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
                                    }
                                }
                              },
                            @{@"title":@"UIPopoverController", @"subTitle":@"预留可编辑控件为此cell", @"option":^{
                                if (IS_IPHONE) {
                                    [weakSelf showAlertMessage:@"UIPopoverController只能在ipad中使用！"];
                                }
                                else
                                {
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
                                    }
                                }
                            }
                           }
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
                         @{@"title":@"UIAlertView:iOS9中弃用，能适用于iPad、iPhone中"}, @{@"items":@[
                               @{@"title":@"UIAlertView", @"subTitle":@"默认样式", @"option":^{
                                   [weakSelf showAlertMessage:@"这是一个UIAlertView！"];
                               }},
                               @{@"title":@"UIAlertView", @"subTitle":@"多按钮添加", @"option":^{
                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"选择" message:@"请选择一个数！" delegate:weakSelf cancelButtonTitle:@"取消" otherButtonTitles:nil];
                                   for (int index = 0; index < 100; index++) {
                                       [alertView addButtonWithTitle:[NSString stringWithFormat:@"%i", index]];
                                   }
                                   [alertView show];
                               }},
                               @{@"title":@"UIAlertView", @"subTitle":@"输入操作", @"option":^{
                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录" message:@"请输入账号和密码！" delegate:weakSelf cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
                                   [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
                                   UITextField * firstTextField = [alertView textFieldAtIndex:0];
                                   firstTextField.placeholder = @"请输入账号！";
                                   UITextField * secondTextField = [alertView textFieldAtIndex:1];
                                   secondTextField.placeholder = @"请输入密码！";
                                   
                                   [alertView show];
                               }}
                               ]},
                         @{@"title":@"UIActionSheet:iOS9中弃用，能适用于iPad、iPhone中"}, @{@"items":@[
                                @{@"title":@"UIActionSheet", @"subTitle":@"从UIWindow弹出", @"option":^{
                                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"图片来源" delegate:weakSelf cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机", @"相册", nil];
                                    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
                                }},
                                @{@"title":@"UIActionSheet", @"subTitle":@"从UIBarButtonItem弹出", @"option":^{
                                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"图片来源" delegate:weakSelf cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机", @"相册", nil];
                                    
                                    [actionSheet showFromBarButtonItem:weakSelf.navigationItem.rightBarButtonItem animated:YES];
                                }},
                                @{@"title":@"UIActionSheet", @"subTitle":@"从UITabBar弹出", @"option":^{
                                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"图片来源" delegate:weakSelf cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机", @"相册", nil];
                                    
                                    [actionSheet showFromTabBar:weakSelf.tabBarController.tabBar];
                                }},
                                @{@"title":@"UIActionSheet", @"subTitle":@"从UIView弹出", @"option":^{
                                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"图片来源" delegate:weakSelf cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机", @"相册", nil];
                                    
                                    [actionSheet showFromRect:CGRectMake(0, 0, 100, 100) inView:self.tableView animated:YES];
                                }}
                            ]},
                         @{@"title":@"UIAlertController:iOS8中提供，能用于iPad、iPhone中"}, @{@"items":@[
                              @{@"title":@"UIAlertController", @"subTitle":@"UIAlertControllerStyleAlert样式", @"option":^{
                                  //创建UIAlertController 设置标题，信息，样式
                                  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录" message:@"请输入账号密码！" preferredStyle:UIAlertControllerStyleAlert];
                                  
                                  //添加UITextField
                                  [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                                      textField.placeholder = @"请输入账号！";
                                      //为UITextField添加监听事件
                                      [textField addTarget:weakSelf action:@selector(textFieldChane:) forControlEvents:UIControlEventEditingChanged];
                                  }];
                                  //添加UITextField
                                  [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                                      textField.placeholder = @"请输入密码！";
                                      //为UITextField添加监听事件
                                      [textField addTarget:weakSelf action:@selector(textFieldChane:) forControlEvents:UIControlEventEditingChanged];
                                  }];
                                  
                                  //创建UIAlertAction对象，设置标题并添加到UIAlertController上
                                  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
                                  [alertController addAction:cancelAction];
                                  UIAlertAction *loginAction = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                      
                                  }];
                                  //设置UIAlertAction对象是否可用
                                  loginAction.enabled = NO;
                                  [alertController addAction:loginAction];
                                  
                                  //展现UIAlertController
                                  [weakSelf presentViewController:alertController animated:YES completion:nil];
                              }},
                              @{@"title":@"UIAlertController", @"subTitle":@"UIAlertControllerStyleActionSheet样式", @"option":^{
                                  //创建UIAlertController 设置标题，信息，样式
                                  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"图片来源" message:@"请添加图片！" preferredStyle:UIAlertControllerStyleActionSheet];
                                  
                                  
                                  //创建UIAlertAction对象，设置标题并添加到UIAlertController上
                                  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                                  [alertController addAction:cancelAction];
                                  UIAlertAction *photpAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                      
                                  }];
                                  [alertController addAction:photpAction];
                                  UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                      
                                  }];
                                  [alertController addAction:cameraAction];
                                  if (IS_IPHONE) {
                                  }
                                  else
                                  {
                                      //如果在ipad上运行需要设置UIPopoverPresentationController的相关属性
                                      UIPopoverPresentationController *popoverPresentCtr = alertController.popoverPresentationController;
                                      popoverPresentCtr.barButtonItem = weakSelf.navigationItem.rightBarButtonItem;
                                  }
                                  
                                  //展现UIAlertController
                                  [weakSelf presentViewController:alertController animated:YES completion:nil];
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
- (void)textFieldChane:(UITextField *)sender
{
    UIAlertController *alertViewController = (UIAlertController *)self.presentedViewController;
    UITextField *accountTextField = [alertViewController.textFields lastObject];
    UITextField *passwordTextField = [alertViewController.textFields lastObject];
    UIAlertAction *loginAction = [alertViewController.actions lastObject];
    if (accountTextField.text.length > 0 && passwordTextField.text.length > 0) {
        loginAction.enabled = YES;
    }
    else
    {
        loginAction.enabled = NO;
    }
}
- (void)rightBarButtonAction:(UIBarButtonItem *)sender
{
    __weak typeof(self) weakSelf = self;
    
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
}

#pragma mark - 控制器周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingUi];
}

#pragma mark - 自定义方法
- (void)showAlertMessage:(NSString *)message
{
    __weak typeof(self) weakSelf = self;
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:weakSelf cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];
}
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

#pragma mark - <UIAlertViewDelegate>代理方法
- (void)alertViewCancel:(UIAlertView *)alertView
{
    NSLog(@"%s", __FUNCTION__);
}

@end

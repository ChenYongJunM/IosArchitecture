//
//  VCMessageViewController.m
//  V_Cat
//
//  Created by my on 15/7/21.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "VCMessageViewController.h"
#import "TestTableViewCell.h"
#import "TestObj.h"
#import "VCCDataHelper.h"
#import "TestAobj.h"
#import "TestATableViewCell.h"
#import "MHUploadParam.h"
#import "XQFeedModel.h"
#import "FDFeedEntity.h"
#import "FDFeedCell.h"

@interface VCMessageViewController ()

/**
 *  解析json数据后得到的数据
 */
@property (strong, nonatomic) NSArray *feedsDataFormJSON;
/**
 *  用于给数据源使用的数组
 */
@property (strong, nonatomic) NSMutableArray *feeds;

@end

@implementation VCMessageViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.enablePullDownToRefresh = YES;
        self.enablePullUpToRefresh = YES;
//
//        self.enablePullUpToRefreshBeforeLoadText = @"上拉加载更多数据";
//        self.enablePullUpToRefreshLoadingText    = @"数据加载中~...";
//        self.enablePullUpToRefreshNilDataText    = @"";
//        self.enableNilModelsAlertTest = @"暂无数据";
//        self.enablePullUpToRefreshNilDataText    = @"数据已加载完";
        
        VCCDataHelper *help = [VCCDataHelper sharedInstance];
        help.bankInfo.id = @"21312";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNaviBarTitle:@"消息"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadJSONData:^{ // 加载完josn数据后要做的操作
        
        self.feeds = @[].mutableCopy;
        
        [self.feeds addObject:self.feedsDataFormJSON.mutableCopy];
        
        [self beginDownPushRefreshing];
        [self.tableView reloadData];
        
    }];
}

#pragma mark - 加载json数据
- (void) loadJSONData:(void(^)()) then {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *dataFilePath =[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:nil];
        
        NSArray *feedArray = dataDictionary[@"feed"];
        
        NSMutableArray *feedArrayM = @[].mutableCopy;
        
        [feedArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            [feedArrayM addObject:[XQFeedModel feedWithDictionary:obj]];
        }];
        
        self.feedsDataFormJSON = feedArrayM;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            !then ? : then();
        });
    });
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
//    [MHNetworkManager getRequstWithURL:@"http://dev.feiniubus.com:9031/api/common/Fence" params:nil successBlock:^(NSDictionary *returnData) {
//        
//    } failureBlock:^(NSError *error) {
//        
//    } showHUD:YES];
//    
//    
//    MHUploadParam *param =[[MHUploadParam alloc] init];
//    param.name = @"file";
//    param.fileName = @"image1.jpg";
//    param.data = UIImageJPEGRepresentation([self fixOrientation:[UIImage imageNamed:@"loading_1.png"]], 0.5);
//    param.mimeType = @"image/jpeg";
//    
//    [MHNetworkManager uploadFileWithURL:@"http://dev.feiniubus.com:9030/api/common/Resources" params:@{@"type":@1} successBlock:^(NSDictionary *returnData) {
//        
//    } failureBlock:^(NSError *error) {
//        
//    } uploadParam:param showHUD:YES];

}

#pragma mark - Override Supper.

- (void)loadCellModelMapping
{
//    [super registerModelClass:[TestObj class] mappedCellClass:[TestTableViewCell class] reuseIdentifier:@"TestTableViewCell"];
//    [super registerModelClass:[TestAobj class] mappedCellClass:[TestATableViewCell class] reuseIdentifier:@"TestATableViewCell"];
    
    [super registerModelClass:[XQFeedModel class] mappedCellClass:[FDFeedCell class] reuseIdentifier:@"FDFeedCell"];
}

- (void)fetchDataWithOffset:(NSString *)offset
{
    [super fetchDataWithOffset:offset];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self finishDataFetchWithModels:self.feeds[0] currentOffset:offset];
    });
    
}

- (void)configureCell:(UITableViewCell<CYModelBinding> *)cell forIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell forIndexPath:indexPath];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    VCMessageViewController *net = [[VCMessageViewController alloc] init];
    
    [self.navigationController pushViewController:net animated:YES];
    //    [self GOpushViewController:[NextController new]];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"第%ld组",section];
//}




- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end

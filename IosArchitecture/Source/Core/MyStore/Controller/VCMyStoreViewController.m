//
//  MyStoreViewController.m
//  V_Cat
//
//  Created by my on 15/7/21.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "VCMyStoreViewController.h"

#import "VCLoginModel.h"
#import "TestObj.h"
#import "TestTableViewCell.h"

@interface VCMyStoreViewController ()
{
    
}
@end

@implementation VCMyStoreViewController

-(NSString *)JsonDataBy:(id)theData{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil){
        NSString *string = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return string;
    }else{
        return nil;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.enablePullDownToRefresh = YES;
        self.enablePullUpToRefresh = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNaviBarTitle:@"首页"];
    
    self.view.frame = CGRectMake(0, 0, 200, 50);
    self.view.layer.borderColor = [UIColor redColor].CGColor;
    
    
//    if (![[VCCDataHelper sharedInstance] user].token) {
//        [[VCApiHelper defaultVCApiHelper] apiLoginWithParamDic:[@{@"phoneNum":@"18202818835",@"passWord":[Encryptor md5:@"000000"]} mutableCopy] withMethod:@"POST" success:^(NSString *info, id responseObject) {
//            
//            VCLoginModel *loginModel = (VCLoginModel *)responseObject;
//            
//            [self dismissLoadHUDWithSuccessText:loginModel.msg];
//            [[VCCDataHelper sharedInstance] user].token = loginModel.token;
//            [[VCCDataHelper sharedInstance] user].buyerToken = loginModel.buyerToken;
//            [[VCCDataHelper sharedInstance] user].supplierBind = loginModel.supplierBind;
//            [[NSManagedObjectContext mainContext] saveNested];
//        } goApiFailure:^(NSString *error) {
//            NSLog(@"%@",error);
//        } httpFailure:^(NSString *error) {
//            NSLog(@"%@",error);
//        }];
//    }
//
//    
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        //小店信息
//        [[VCApiHelper defaultVCApiHelper] apiGetShopInfoWithParamDic:nil withMethod:@"GET" success:^(NSString *info, id responseObject) {
//            
//        } goApiFailure:^(NSString *error) {
//            
//        } httpFailure:^(NSString *error) {
//            
//        }];
//    });
    
    [self beginDownPushRefreshing];
}

- (void)loadCellModelMapping
{
        [super registerModelClass:[TestObj class] mappedCellClass:[TestTableViewCell class] reuseIdentifier:@"TestTableViewCell"];
}

- (void)fetchDataWithOffset:(NSString *)offset
{
    [super fetchDataWithOffset:offset];
    
    NSMutableArray *datas = @[].mutableCopy;
    for (int i = 0; i < 100; i++) {
        TestObj *new = [TestObj new];
        [datas addObject:new];
    }
    [NSThread sleepForTimeInterval:2.0];
    [self finishDataFetchWithModels:datas currentOffset:offset];
    
}

- (void)configureCell:(UITableViewCell<CYModelBinding> *)cell forIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell forIndexPath:indexPath];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextAction:(id)sender
{
    [self.navigationController pushViewController:[VCMyStoreViewController new] animated:YES];
}


@end

//
//  VCCDataHelper.m
//  StructureProject
//
//  Created by my on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "VCCDataHelper.h"

@implementation VCCDataHelper

+ (VCCDataHelper *)sharedInstance {
    static dispatch_once_t pred;
    __strong static VCCDataHelper *sharedInternal = nil;
    
    dispatch_once(&pred, ^{
        sharedInternal = [[VCCDataHelper alloc] init];
    });
    
    return sharedInternal;
}

- (ATShop *)shopInfo
{
    ATShop *shop = [ATShop fetchSingleWithPredicate:nil];
    return shop;
}

- (ATBankInfo *)bankInfo
{
    ATBankInfo *banInfo = [ATBankInfo fetchSingleWithPredicate:nil];
    return banInfo;
}

- (ATBank *)bank
{
    ATBank *bank = [ATBank fetchSingleWithPredicate:nil];
    return bank;
}

- (ATUser *)user
{
    ATUser *user = [ATUser fetchSingleWithPredicate:nil];
    return user;
}


- (void)initializeCoreData
{
    ATShop      *shopInfo = [ATShop insert];
    ATBankInfo  *bankInfo = [ATBankInfo insert];
    ATBank      *bank     = [ATBank insert];
    ATUser   *user  = [ATUser insert];
    
    shopInfo.avatarUrl = @"";
    shopInfo.idCard = @"";
    shopInfo.levelName = @"";
    shopInfo.parentShopName = @"";
    shopInfo.phoneNum = @"";
    shopInfo.shopId = @"";
    shopInfo.shopName = @"";
    shopInfo.shopNum = 0;
    shopInfo.totalFund = 0;
    
    bankInfo.accountName = @"";
    bankInfo.accountNumber = @"";
    bankInfo.active = 0;
    bankInfo.branchName = @"";
    bankInfo.city = @"";
    bankInfo.id = @"";
    bankInfo.isNewRecord = 0;
    bankInfo.province = @"";
    bankInfo.shopId = @"";
    
    user.guruId = @"";
    user.token  = @"";
    user.buyerToken = @"";
    user.supplierBind = 0;
    user.phoneNum = @"";
    user.passWord = @"";
    
    
    bank.isNewRecord = 0;
    bank.name = @"";
    
    shopInfo.bankInfo = bankInfo;
    shopInfo.bankInfo.bank = bank;
}

@end

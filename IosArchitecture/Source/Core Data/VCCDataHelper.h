//
//  VCCDataHelper.h
//  StructureProject
//
//  Created by my on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATBankInfo.h"
#import "ATBank.h"
#import "ATShop.h"
#import "ATUser.h"

@interface VCCDataHelper : NSObject

+ (VCCDataHelper *)sharedInstance;


- (ATShop *)shopInfo;
- (ATBankInfo *)bankInfo;
- (ATBank *)bank;
- (ATUser *)user;

- (void)initializeCoreData;

@end

//
//  ATShop.h
//  V_Cat
//
//  Created by my on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ATBankInfo;

@interface ATShop : NSManagedObject

@property (nonatomic, retain) NSString * avatarUrl;
@property (nonatomic, retain) NSString * idCard;
@property (nonatomic, retain) NSString * levelName;
@property (nonatomic, retain) NSString * parentShopName;
@property (nonatomic, retain) NSString * phoneNum;
@property (nonatomic, retain) NSString * shopId;
@property (nonatomic, retain) NSString * shopName;
@property (nonatomic, retain) NSNumber * shopNum;
@property (nonatomic, retain) NSDecimalNumber * totalFund;
@property (nonatomic, retain) ATBankInfo *bankInfo;

@end

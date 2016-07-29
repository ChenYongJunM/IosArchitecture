//
//  ATBankInfo.h
//  V_Cat
//
//  Created by my on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ATBank, ATShop;

@interface ATBankInfo : NSManagedObject

@property (nonatomic, retain) NSString * accountName;
@property (nonatomic, retain) NSString * accountNumber;
@property (nonatomic, retain) NSNumber * active;
@property (nonatomic, retain) NSString * branchName;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSNumber * isNewRecord;
@property (nonatomic, retain) NSString * province;
@property (nonatomic, retain) NSString * shopId;
@property (nonatomic, retain) ATBank *bank;
@property (nonatomic, retain) ATShop *shop;

@end

//
//  ATBank.h
//  V_Cat
//
//  Created by my on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ATBankInfo;

@interface ATBank : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * isNewRecord;
@property (nonatomic, retain) ATBankInfo *bankInfo;

@end

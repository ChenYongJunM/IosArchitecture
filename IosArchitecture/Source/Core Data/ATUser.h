//
//  ATGeneral.h
//  
//
//  Created by my on 15/7/22.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ATUser : NSManagedObject

@property (nonatomic, retain) NSString * token;
@property (nonatomic, retain) NSString * guruId;
@property (nonatomic, retain) NSString * buyerToken;
@property (nonatomic, retain) NSString * supplierBind;
@property (nonatomic, retain) NSString * phoneNum;
@property (nonatomic, retain) NSString * passWord;

@end

//
//  VCLoginModel.h
//  V_Cat
//
//  Created by my on 15/7/23.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

@interface VCLoginModel : NSObject

//@breif 买家token
@property(nonatomic,strong)NSString *buyerToken;

//@breif 达人ID
@property(nonatomic,strong)NSString *guruId;

//@breif 是否绑定品牌
@property(nonatomic,strong)NSString *supplierBind;

//@breif 用户token
@property(nonatomic,strong)NSString *token;


@end

//
//  MHAsiNetworkUrl.h
//
//  Created by ChenYJ on 15/7/19.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#ifndef MHProject_MHAsiNetworkUrl_h
#define MHProject_MHAsiNetworkUrl_h
///**
// *  正式环境
// */
//#define API_HOST @"http://123.59.61.167/api/JNWTV"

///**
// *   测试环境
// */
#define API_HOST @"http://120.132.61.55/api/JNWTV"

//      接口路径全拼
#define PATH(_path)             [NSString stringWithFormat:_path, API_HOST]
/**
 *      首页
 */
#define DEF_GetHomepage         PATH(@"%@/GetHomepage")

/**
 *      上传头像
 */
#define DEF_UploadHeadImg       PATH(@"%@/UploadHeadImg")

#endif

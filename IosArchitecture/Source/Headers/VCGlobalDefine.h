//
//  VCGlobalDefine.h
//  V_Cat
//
//  Created by my on 15/7/21.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#ifndef StructureProject_Constants_h
#define StructureProject_Constants_h

#define APPDELEGATE                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]


/**
 *  coredata名称
 */
#define kCoreDataModelName      @"ATDataModel"
#define sandBoxPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]
#define sandBoxTempPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)objectAtIndex:0]

// assert
#ifdef ENABLE_ASSERT_STOP
#define APP_ASSERT_STOP                     {LogRed(@"APP_ASSERT_STOP"); NSAssert1(NO, @" \n\n\n===== APP Assert. =====\n%s\n\n\n", __PRETTY_FUNCTION__);}
#define APP_ASSERT(condition)               {NSAssert(condition, @" ! Assert");}
#else
#define APP_ASSERT_STOP                     do {} while (0);
#define APP_ASSERT(condition)               do {} while (0);
#endif

#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]


#define RGB(r,g,b) RGBA(r,g,b,1)

#define RGBA(r,g,b,a) [UIColor \
colorWithRed:r/255.0 \
green:g/255.0 \
blue:b/255.0 alpha:a]

#endif

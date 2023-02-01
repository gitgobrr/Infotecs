

#import <Foundation/Foundation.h>
#if !TARGET_OS_IPHONE
#import "NewIOKit.h"
#endif
@interface SystemInfo : NSObject
+ (NSArray<NSString *> *) sysctlInfo;

#if TARGET_OS_MAC
///  Информация для Cocoa приложений
+ (NSArray<NSString *> *) nsProcInfo;

/// I/O Kit
#if !TARGET_OS_IPHONE
+ (NSArray<NSString *> *) ioKitInfo;
#endif

#endif
@end

//
//  NewIOKit.h
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

#ifndef NewIOKit_h
#define NewIOKit_h

#import <Foundation/Foundation.h>

#if !TARGET_OS_IPHONE
#import <IOKit/IOKitLib.h>
#endif

@interface MyIOKit : NSObject
+(NSDictionary *) getCpuIds;
+(NSString *) getPlatformSerialNumber;
+(NSString*) objc_println:(NSString*) format, ...;

+(NSArray<NSString *>*) iokitInfo;
@end

#endif /* NewIOKit_h */

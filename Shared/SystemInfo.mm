#import "SystemInfo.h"
#import "Sysctl.h"


@implementation SystemInfo: NSObject
+(NSString *) objcStringC:(char const *) s {
    return [NSString stringWithCString:s encoding:NSUTF8StringEncoding];
}
+(NSString *) objcStringCPP:(std::string const &) s {
    return [self objcStringC: s.c_str()];
}

+(NSArray<NSString *> *) sysctlInfo {
    return [NSArray<NSString *> arrayWithObjects:
            [self objcStringCPP: Sysctl::hostName],
            [self objcStringCPP: Sysctl::osType],
            [self objcStringCPP: Sysctl::osRelease],
            [self objcStringCPP: Sysctl::osVersion],
            [self objcStringCPP: Sysctl::version],
            [self objcStringCPP: Sysctl::machine],
            [self objcStringCPP: Sysctl::model],
#if !TARGET_OS_IPHONE
            [self objcStringCPP:Sysctl::cpuBrandString],
            [NSString stringWithFormat:@"kern.osrevision: %d", Sysctl::osRev],
            [NSString stringWithFormat:@"hw.tbfrequency: %lld", Sysctl::cpuFreq],
            [NSString stringWithFormat:@"hw.memsize: %lld", Sysctl::memSize],
#endif
            [NSString stringWithFormat:@"hw.ncpu: %d", Sysctl::nCPU],
            [NSString stringWithFormat:@"hw.activecpu: %d", Sysctl::activeCPU]
            ,nil];
}
+ (NSArray<NSString *> *) nsProcInfo {
    NSProcessInfo* pinfo = [NSProcessInfo processInfo];
    
    return [NSArray<NSString *> arrayWithObjects:
            [NSString stringWithFormat: @"Process Name: %@", [pinfo processName]],
            [NSString stringWithFormat: @"PID: %d", [pinfo processIdentifier]],
            [NSString stringWithFormat: @"Process GUID: %@", [pinfo globallyUniqueString]],
            [NSString stringWithFormat: @"OS Version: %@", [pinfo operatingSystemVersionString]],
            [NSString stringWithFormat: @"Total Processors: %lu", [pinfo processorCount]],
            [NSString stringWithFormat: @"Active Processors: %lu",[pinfo activeProcessorCount]],
            [NSString stringWithFormat: @"Total RAM: %llu bytes", [pinfo physicalMemory]]
            ,nil];
}
#if !TARGET_OS_IPHONE
+ (NSArray<NSString *> *)ioKitInfo {
    return MyIOKit.iokitInfo;
}
#endif
@end

//
//  IOKit.m
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

#import "NewIOKit.h"

#if !TARGET_OS_IPHONE

@implementation MyIOKit
+ (NSDictionary*) getCpuIds {
    NSMutableDictionary*    cpuInfo = [[NSMutableDictionary alloc] init];
    CFMutableDictionaryRef  matchClasses = NULL;
    kern_return_t           kernResult = KERN_FAILURE;
    mach_port_t             machPort;
    io_iterator_t           serviceIterator;
    
    io_object_t             cpuService;
    
    kernResult = IOMainPort( MACH_PORT_NULL, &machPort );
    if( KERN_SUCCESS != kernResult ) {
        printf( "IOMasterPort failed: %d\n", kernResult );
    }
    
    matchClasses = IOServiceNameMatching( "processor" );
    if( NULL == matchClasses ) {
        printf( "IOServiceMatching returned a NULL dictionary" );
    }
    
    kernResult = IOServiceGetMatchingServices( machPort, matchClasses, &serviceIterator );
    if( KERN_SUCCESS != kernResult ) {
        printf( "IOServiceGetMatchingServices failed: %d\n", kernResult );
    }
    
    while( (cpuService = IOIteratorNext( serviceIterator )) ) {
        CFTypeRef CPUIDAsCFNumber = NULL;
        io_name_t nameString;
        IORegistryEntryGetNameInPlane( cpuService, kIOServicePlane, nameString );
        
        CPUIDAsCFNumber = IORegistryEntrySearchCFProperty( cpuService,
                                                          kIOServicePlane,
                                                          CFSTR( "IOCPUID" ),
                                                          kCFAllocatorDefault,
                                                          kIORegistryIterateRecursively);
        
        if( NULL != CPUIDAsCFNumber ) {
            NSString* cpuName = [NSString stringWithCString:nameString encoding: NSUTF8StringEncoding];
            [cpuInfo setObject:(__bridge NSNumber*)CPUIDAsCFNumber forKey:cpuName];
        }
        
        if( NULL != CPUIDAsCFNumber ) {
            CFRelease( CPUIDAsCFNumber );
        }
    }
    
    IOObjectRelease( serviceIterator );
    
    return cpuInfo;
}
+(NSString *) getPlatformSerialNumber {
    io_registry_entry_t     rootEntry = IORegistryEntryFromPath( kIOMainPortDefault, "IOService:/" );
    CFTypeRef serialAsCFString = NULL;
    
    serialAsCFString = IORegistryEntryCreateCFProperty( rootEntry,
                                                       CFSTR(kIOPlatformSerialNumberKey),
                                                       kCFAllocatorDefault,
                                                       0);
    
    IOObjectRelease( rootEntry );
    return (__bridge NSString *)((NULL != serialAsCFString) ? serialAsCFString : nil);
}

+ (NSString*)objc_println:(NSString *)format, ... {
    va_list args;
    
    if (![format hasSuffix: @"\n"]) {
        format = [format stringByAppendingString: @"\n"];
    }
    
    va_start (args, format);
    NSString *body =  [[NSString alloc] initWithFormat: format
                                             arguments: args];
    va_end (args);
    
    fprintf(stderr,"%s",[body UTF8String]);
    return body;
}

+ (NSArray<NSString *> *)iokitInfo {
    NSDictionary *cpuInfo = [self getCpuIds];
    NSArray* keys = [[cpuInfo allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    NSMutableArray *arr = [NSMutableArray array];
    for( id key in keys ) {
        NSString *str = [self objc_println:
                             @"%@ has ID: 0x%8.8x",
                         key,
                         [(NSNumber*)[cpuInfo objectForKey: key] unsignedIntValue]
        ];
        [arr addObject:str];
    }
    
    [arr addObject:[self objc_println:@"Serial Number: %@", [self getPlatformSerialNumber]]];
    
    return arr;
}
@end

#endif

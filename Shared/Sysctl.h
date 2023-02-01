
#ifndef Sysctl_h
#define Sysctl_h

#if __APPLE__
#include "TargetConditionals.h"
#endif

#include <iostream>
#include <string.h>
#include <stdlib.h>

#include <sys/sysctl.h>

/// A "static"-only namespace around a series of functions that operate on buffers returned from the `sysctl` function
class Sysctl
{
public:
    // methods
    
    /// Invoke `sysctl` with the specified name, interpreting the returned buffer as a `String`.
    static char* stringForName(const char* str);
    
    /// Invoke `sysctl` with an array of identifers, interpreting the returned buffer as a `String`.
    static char* stringForKeys(int mib[]);
    
    /// Invoke `sysctl` with the specified name, interpreting the returned buffer as the specified type.
    template<typename T>
    static T valForName(const char* str);
    
    /// Invoke `sysctl` with an array of identifers, interpreting the returned buffer as the specified type.
    template<typename T>
    static T valForKeys(int mib[]);
    
    // attributes
    
    /// e.g. "MyComputer.local" (from System Preferences -> Sharing -> Computer Name) or
    /// "My-Name-iPhone" (from Settings -> General -> About -> Name)
    static std::string hostName;
    
    /// e.g. "x86_64" or "N71mAP"
    static std::string machine;
    
    /// e.g. "MacPro4,1" or "iPhone8,1"
    static std::string model;
    
    /// e.g. "Darwin" or "Darwin"
    static std::string osType;
    
    /// e.g. "15.3.0" or "15.0.0"
    static std::string osRelease;
    
    /// e.g. "15D21" or "13D20"
    static std::string osVersion;
    
    /// e.g. "Darwin Kernel Version 15.3.0: Thu Dec 10 18:40:58 PST 2015; root:xnu-3248.30.4~1/RELEASE_X86_64" or
    /// "Darwin Kernel Version 15.0.0: Wed Dec  9 22:19:38 PST 2015; root:xnu-3248.31.3~2/RELEASE_ARM64_S8000"
    static std::string version;
    
    /// e.g. "8" or "2"
    static int activeCPU;
    
    /// e.g. "8" or "2"
    static int nCPU;
    
#if !TARGET_OS_IPHONE
    /// e.g. Apple M1 (not available on iOS)
    static std::string cpuBrandString;
    
    /// e.g. 199506 (not available on iOS)
    static __INT32_TYPE__ osRev;
    
    /// e.g. 2400000000 (not available on iOS)
    static __INT64_TYPE__ cpuFreq;
    
    /// e.g. 17179869184 (not available on iOS)
    static __INT64_TYPE__ memSize;
#endif
};

#endif /* Sysctl_h */

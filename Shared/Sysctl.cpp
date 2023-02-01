
#include "Sysctl.h"


char* Sysctl::stringForName(const char *str) {
    char *strRes;
    size_t len;
    sysctlbyname(str, NULL, &len, NULL, 0);
    strRes = static_cast<char*>(malloc(len));
    sysctlbyname(str, strRes, &len, NULL, 0);
    
    char *ba = new char[ strlen( str ) + strlen( strRes ) + strlen(": ") + 1];
    strcpy(ba, str);
    strcat(ba, ": ");
    strcat(ba, strRes);
    return ba;
}

char* Sysctl::stringForKeys(int mib[]) {
    char *strRes;
    size_t len;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    strRes = static_cast<char*>(malloc(len));
    sysctl(mib, 2, strRes, &len, NULL, 0);
    free(mib);
    return strRes;
}

template<typename T>
T Sysctl::valForName(const char *str) {
    T val;
    size_t len = sizeof(val);
    sysctlbyname(str, &val, &len, NULL, 0);
    return val;
}

template<typename T>
T Sysctl::valForKeys(int mib[]) {
    T val;
    size_t len = sizeof(val);
    sysctl(mib, 2, val, &len, NULL, 0);
    free(mib);
    return val;
}

std::string Sysctl::hostName = stringForName("kern.hostname");
std::string Sysctl::osType = stringForName("kern.ostype");
std::string Sysctl::osRelease = stringForName("kern.osrelease");
std::string Sysctl::osVersion = stringForName("kern.osversion");
std::string Sysctl::version = stringForName("kern.version");
int Sysctl::nCPU = valForName<int>("hw.ncpu");
int Sysctl::activeCPU = valForName<int>("hw.activecpu");

/// NOTE: this is *corrected* on iOS devices
#if TARGET_OS_IPHONE && !TARGET_OS_SIMULATOR && !defined(__x86_64__) && !defined(__i386__) //!arch(x86_64) && !arch(i386)
std::string Sysctl::model = strcat(strdup("hw.model: "),
                                   stringForKeys(new int[2]{CTL_HW, HW_MACHINE}));
std::string Sysctl::machine = strcat(strdup("hw.machine: "),
                                     stringForKeys(new int[2]{CTL_HW, HW_MODEL}));
#else
std::string Sysctl::machine = stringForName("hw.machine");
std::string Sysctl::model = stringForName("hw.model");
#endif

#if !TARGET_OS_IPHONE

std::string Sysctl::cpuBrandString = stringForName("machdep.cpu.brand_string");
__INT32_TYPE__ Sysctl::osRev = valForName<__INT32_TYPE__>("kern.osrevision");
__INT64_TYPE__ Sysctl::cpuFreq = valForName<__INT64_TYPE__>("hw.tbfrequency");
__INT64_TYPE__ Sysctl::memSize = valForName<__INT64_TYPE__>("hw.memsize");

#endif

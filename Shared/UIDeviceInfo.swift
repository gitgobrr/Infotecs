//
//  UIDeviceInfo.swift
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

import UIKit.UIDevice

extension UIDevice {
    static let uiDeviceInfo: [String] = {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        var uiDeviceInfo = [
            "Name: "+device.name,
            "System version: "+device.systemName+" "+device.systemVersion
        ]
#if !targetEnvironment(simulator) && !targetEnvironment(macCatalyst)
        let physicalDeviceInfo = [
            "Battery level at: \(device.batteryLevel)%",
            "Battery State: " + {
                switch device.batteryState {
                case .unknown:
                    return "unknown"
                case .unplugged:
                    return "unplugged"
                case .charging:
                    return "Charging"
                case .full:
                    return "Full"
                @unknown default:
                    return "unknown"
                }
            }()
        ]
        uiDeviceInfo += physicalDeviceInfo
#endif
        return uiDeviceInfo
    }()
}

//
//  SystemInfoView.swift
//  Infotecs
//
//  Created by sergey on 04.02.2023.
//

import SwiftUI

struct SystemInfoView: View {
    let sysctlInfo = SystemInfo.sysctlInfo() ?? []
    let nsProcessInfo = SystemInfo.nsProcInfo() ?? []
#if os(iOS)
    let uiDeviceInfo = UIDevice.uiDeviceInfo
#endif
#if os(macOS)
    let iokit = MyIOKit.iokitInfo() ?? []
#endif
    var body: some View {
        List {
            Section {
                ForEach(0..<sysctlInfo.count, id: \.self) { index in
                    Text(sysctlInfo[index])
                }
            } header: {
                Text("sysctl")
            }
            Section {
                ForEach(0..<nsProcessInfo.count, id: \.self) { index in
                    Text(nsProcessInfo[index])
                }
            } header: {
                Text("NSProcessInfo")
            }
#if os(iOS)
            Section {
                ForEach(uiDeviceInfo, id: \.self) { info in
                    Text(info)
                }
            } header: {
                Text("UIDeviceInfo")
            }
#endif
#if os(macOS)
            Section {
                ForEach(0..<iokit.count, id: \.self) { index in
                    Text(iokit[index])
                }
            } header: {
                Text("IOKIT")
            }
#endif
        }
    }
}

struct SystemInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SystemInfoView()
    }
}

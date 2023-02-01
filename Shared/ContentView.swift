//
//  ContentView.swift
//  InfotecsTest
//
//  Created by sergey on 30.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab = 1
    let sysctlInfo = SystemInfo.sysctlInfo() ?? []
    let nsProcessInfo = SystemInfo.nsProcInfo() ?? []
    #if os(iOS)
    let uiDeviceInfo = UIDevice.uiDeviceInfo
    #endif
    #if os(macOS)
    let iokit = MyIOKit.iokitInfo() ?? []
    #endif
    @State var textFieldText = WriteDocument.readDoc() ?? ""
    var body: some View {
        TabView(selection: $currentTab) {
            List {
                Section(header: Text("sysctl")) {
                    ForEach(0..<sysctlInfo.count, id: \.self) { index in
                        Text(sysctlInfo[index])
                    }
                }
                Section(header: Text("NSProcessInfo")) {
                    ForEach(0..<nsProcessInfo.count, id: \.self) { index in
                        Text(nsProcessInfo[index])
                    }
                }
#if os(iOS)
                Section(header: Text("UIDeviceInfo")) {
                    ForEach(uiDeviceInfo, id: \.self) { info in
                        Text(info)
                    }
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
            .tag(0)
            .tabItem {
                Image(systemName: "info.circle")
            }
            List {
                HStack {
                    Text("Text from doc: ")
                    Spacer()
                    TextField("Enter text...", text: $textFieldText)
                        .onChange(of: textFieldText) { newValue in
                            WriteDocument.writeDoc(newValue)
                        }
                }
            }
            .tag(1)
            .tabItem {
                Image(systemName: "person.circle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

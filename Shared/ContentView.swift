//
//  ContentView.swift
//  InfotecsTest
//
//  Created by sergey on 30.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTab = 1
    var body: some View {
        TabView(selection: $currentTab) {
            NavigationView {
                SystemInfoView()
                    .navigationTitle("System Info")
            }
            .tag(0)
            .tabItem {
                Image(systemName: "info.circle")
            }
            NavigationView {
                FileReaderView()
                    .navigationTitle("Files")
                Text("Select File")
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

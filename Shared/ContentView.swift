//
//  ContentView.swift
//  InfotecsTest
//
//  Created by sergey on 30.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab = 1
    var body: some View {
        TabView(selection: $currentTab) {
            SystemInfoView()
                .tag(0)
                .tabItem {
                    Image(systemName: "info.circle")
                }
            FileReaderView()
                .tag(1)
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
        .clipped()
        .edgesIgnoringSafeArea([.horizontal, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

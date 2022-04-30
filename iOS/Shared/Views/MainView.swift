//
//  ContentView.swift
//  Shared
//
//  Created by Justin Zhang on 4/20/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TheBayView(presentPopup: false, questions: [])
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("The Bay")
            }
            Text("Friends Screen")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Popular")
            }
        }
    }
}

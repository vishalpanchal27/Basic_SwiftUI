//
//  TabView.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 01/08/25.
//

import SwiftUI

struct HomeTabView: View {
    
    @State private var selectedTab: Int = 2
    
    var body: some View {
        TabView (selection: $selectedTab) {
            HomeVC()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }.tag(0)
            SearchVC()
                .tabItem {
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            PlayVC()
                .tabItem {
                    Text("Play")
                    Image(systemName: "play")
                }.tag(2)
            NotesVC()
                .tabItem {
                    Text("Notes")
                    Image(systemName: "note.text")
                }.tag(3)
            MessageVC()
                .tabItem {
                    Text("Message")
                    Image(systemName: "message")
                }.tag(4)
            MessageVC()
                .tabItem {
                    Text("Message")
                    Image(systemName: "message")
                }.tag(5)
            MessageVC()
                .tabItem {
                    Text("Message")
                    Image(systemName: "message")
                }.tag(6)
            
        }.accentColor(.red)
    }
}

#Preview {
    HomeTabView()
}

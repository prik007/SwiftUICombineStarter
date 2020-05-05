//
//  ContentView.swift
//  SwiftUICombineStarter
//
//  Created by Khasnobis, Pritha on 03/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        
        TabView {
            Text("Tab1").tabItem() {
                Text("List")
                Image(systemName: "list.bullet")
            }
            Text("Tab2").tabItem() {
                Text("Grid")
                Image(systemName: "grid")
            }
        }
    }
}

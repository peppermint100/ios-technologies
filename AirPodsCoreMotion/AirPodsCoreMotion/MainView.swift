//
//  TabView.swift
//  AirPodsCoreMotion
//
//  Created by peppermint100 on 6/23/24.
//

import SwiftUI

struct MainView: View {
    
    @State var tab = 0
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "headphones")
                    Text("Headphone")
                }
            
            JumpView()
                .tabItem {
                    Image(systemName: "figure.jumprope")
                    Text("Jump")
                }
        }
    }
}

#Preview {
    MainView(tab: 0)
}

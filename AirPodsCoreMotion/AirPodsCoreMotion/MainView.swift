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
            
            SqautView()
                .tabItem {
                    Image(systemName: "figure.cross.training")
                    Text("Squat")
                }
        }
    }
}

#Preview {
    MainView(tab: 0)
}

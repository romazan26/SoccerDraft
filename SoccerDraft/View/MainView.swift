//
//  MainView.swift
//  SoccerDraft
//
//  Created by Роман on 04.08.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            TabView {
                AllPlayersView(isFavorite: false)
                    .tabItem { Image(systemName: "chart.bar.doc.horizontal.fill") }
                AllPlayersView(isFavorite: true).tabItem { Image(systemName: "heart") }
                Text("Favorite").tabItem { Image(systemName: "person.3.fill") }
                Text("Favorite").tabItem { Image(systemName: "gearshape.fill") }
                   
            }
            .onAppear(perform: {
                UITabBar.appearance().backgroundColor = UIColor(resource: .second)
                UITabBar.appearance().unselectedItemTintColor = .gray
            })
            .accentColor(.orangeApp)
        
    }
}

#Preview {
    MainView()
}

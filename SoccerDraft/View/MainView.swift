//
//  MainView.swift
//  SoccerDraft
//
//  Created by Роман on 04.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
            TabView {
                AllPlayersView(vm: vm, isFavorite: false)
                    .tabItem { Image(systemName: "chart.bar.doc.horizontal.fill") }
                AllPlayersView(vm: vm, isFavorite: true)
                    .tabItem { Image(systemName: "heart") }
                FieldView(vm: vm)
                    .tabItem { Image(systemName: "person.3.fill") }
                Text("Settings")
                    .tabItem { Image(systemName: "gearshape.fill") }
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

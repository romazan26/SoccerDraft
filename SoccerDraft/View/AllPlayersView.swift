//
//  AllPlayersView.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI

struct AllPlayersView: View {
    @StateObject var vm = ViewModel()
    var isFavorite = false
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Title bar
                HStack {
                    Text(isFavorite ? "Favorite" : "All players")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    ZStack{
                        Circle()
                            .frame(width: 37)
                            .foregroundStyle(.second)
                        Text("13")
                            .foregroundStyle(.white)
                            .font(.system(size: 17,weight: .heavy))
                    }
                }
                if !vm.allPlayers.isEmpty{
                    ScrollView {
                        ForEach(isFavorite ? vm.favoritePlayers : vm.allPlayers) { player in
                            VStack{
                                PlayerCellView(player: player)
                                OrangeButtonView(text: "View card")
                            }
                        }
                    }
                }else{
                    Text("No players")
                        .foregroundStyle(.white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    AllPlayersView()
}

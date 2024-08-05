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
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
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
                            Text(isFavorite ? "\(vm.favoritePlayers.count)" : "\(vm.allPlayers.count)")
                                .foregroundStyle(.white)
                                .font(.system(size: 17,weight: .heavy))
                        }
                    }
                    
                    //MARK: - Players list
                    if !vm.allPlayers.isEmpty{
                        ScrollView {
                            if isFavorite {
                                PlayersListView(vm: vm, items: vm.favoritePlayers)
                            }else {
                                PlayersListView(vm: vm, items: vm.allPlayers)
                            }
                        }
                    }else{
                        Text("No players")
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }.padding()
                
                //MARK: - Add button
                NavigationLink {
                    AddPlayerView(vm: vm)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundStyle(.orangeApp)
                        .frame(width: 62, height: 62)
                        .padding()
                }

            }
            .sheet(isPresented: $vm.isPresentAddView, content: {
                AddPlayerView(vm: vm)
            })
            .onAppear(perform: {
                
                vm.getAllPlayers()
                vm.getFavoritePlayer()
        })
        }
    }
}

#Preview {
    AllPlayersView()
}

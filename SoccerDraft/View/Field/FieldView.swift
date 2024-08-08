//
//  FieldView.swift
//  SoccerDraft
//
//  Created by Роман on 06.08.2024.
//

import SwiftUI

struct FieldView: View {
    @StateObject var vm: ViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top) ){
            Image(.footbalField)
                .resizable()
                .ignoresSafeArea()
            
            ZStack {
                HStack {
                    ForEach(vm.sortPlayers) { player in
                        DraggablePlayer(player: player)
                    }
                }
                .padding()
                .frame(width: 393, height: 150)
                .background(Color.main)
                
                if vm.allPlayers.count > vm.sortCount{
                    Button {
                        vm.sortCount += 4
                        vm.sortPlayer()
                    } label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.orangeApp)
                    }.padding(.leading, 350)
                }
                
                if vm.allPlayers.count < vm.sortCount{
                    Button {
                        vm.sortCount -= 4
                        vm.sortPlayer()
                    } label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.orangeApp)
                    }.padding(.trailing, 350)
                }
                
            }
            .animation(.bouncy)
            .onAppear {
                vm.sortPlayer()
            }
            
        }
    }
}

struct DraggablePlayer: View {
    
    var player: Player
    
    @State var position: CGSize = .zero
    @State var width: CGFloat = 85
    @State var   height: CGFloat = 120
    var body: some View {
        PlayerCellView(player: player, width: width, height: height)
            .offset(position)
            .gesture(
                DragGesture().onChanged({ value in
                    position = value.translation
                    width = 55
                    height = 70
                })
                .onEnded({ value in
                    
                })
            )
    }
}

#Preview {
    FieldView(vm: ViewModel())
}

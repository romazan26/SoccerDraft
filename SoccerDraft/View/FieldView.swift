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
                HStack {
                    ForEach(vm.allPlayers) { player in
                        DraggablePlayer(player: player)
                    }
                }
                .padding()
                .frame(width: 393)
                .background(Color.main)
                
                
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
                   // position = .zero
                })
            )
    }
}

#Preview {
    FieldView(vm: ViewModel())
}

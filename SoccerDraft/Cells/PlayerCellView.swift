//
//  PlayerCellView.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI

struct PlayerCellView: View {
    
    @ObservedObject var player: Player
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            //MARK: - Photo player
            if let imageData = player.photo{
                Image(uiImage: imageData)
                    .resizable()
                    .frame(width: 158, height: 188)
                    .aspectRatio(contentMode: .fill)
            }else{
                Image(.no).resizable()
            }
            
            //MARK: - Name player
           
            Text("\(player.playerName ?? "")")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .heavy))
                .padding(.top, 150)
            
            //MARK: - Post player
            PostPlayerView(post: "\(player.posr ?? "")")
                .padding(.top)
                .padding(.trailing, 95)
            
        }
        .frame(width: 158, height: 188)
        .cornerRadius(16)
    }
}

#Preview {
    PlayerCellView(player: Player())
}

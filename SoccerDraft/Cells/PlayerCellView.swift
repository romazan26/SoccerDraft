//
//  PlayerCellView.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI

struct PlayerCellView: View {
    
    @ObservedObject var player: Player
    
    var width: CGFloat = 158
    var   height: CGFloat = 188
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            //MARK: - Photo player
            if let imageData = player.photo{
                Image(uiImage: imageData)
                    .resizable()
                    .frame(width: width, height: height)
                    .aspectRatio(contentMode: .fill)
            }else{
                Image(.no).resizable()
            }
            
            //MARK: - Name player
           
            Text("\(player.playerName ?? "")")
                .foregroundStyle(.white)
                .font(.system(size: width / 10, weight: .heavy))
                .padding(.top, width)
            
            //MARK: - Post player
            PostPlayerView(post: "\(player.posr ?? "")", width: width / 5)
                .padding(.top, 10)
                .padding(.trailing, width / 1.53)
            
        }
        .frame(width: width, height: height)
        .cornerRadius(width / 10)
    }
}

//#Preview {
//    PlayerCellView(player: Player())
//}

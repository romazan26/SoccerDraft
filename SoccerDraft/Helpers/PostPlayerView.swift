//
//  PostPlayerView.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI

struct PostPlayerView: View {
    var post = "RF"
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.orangeApp)
                .frame(width: 34)
            Text(post)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .heavy))
        }
    }
}

#Preview {
    PostPlayerView()
}

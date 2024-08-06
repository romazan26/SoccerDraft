//
//  PostPlayerView.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI

struct PostPlayerView: View {
    var post = "RF"
    var width: CGFloat = 34
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.orangeApp)
                .frame(width: width)
            Text(post)
                .foregroundStyle(.white)
                .font(.system(size: width / 2, weight: .heavy))
        }
    }
}

#Preview {
    PostPlayerView()
}

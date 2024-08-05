//
//  OrangeButtonView.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI

struct OrangeButtonView: View {
    var text = "View card"
    var width: CGFloat = 158
    var height: CGFloat = 42
    var radius: CGFloat = 13
    var body: some View {
        ZStack {
            Color.orangeApp
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .heavy))
        }
        .frame(width: width, height: height)
        .cornerRadius(radius)
    }
}

#Preview {
    OrangeButtonView()
}

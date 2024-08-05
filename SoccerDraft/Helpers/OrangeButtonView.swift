//
//  OrangeButtonView.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI

struct OrangeButtonView: View {
    var text = "View card"
    var body: some View {
        ZStack {
            Color.orangeApp
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .heavy))
        }
        .frame(width: 158,height: 42)
        .cornerRadius(13)
    }
}

#Preview {
    OrangeButtonView()
}

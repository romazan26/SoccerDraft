//
//  SettingButton.swift
//  SoccerDraft
//
//  Created by Роман on 08.08.2024.
//

import SwiftUI

struct SettingButton: View {
    var text = ""
    var imageName = ""
    var body: some View {
        ZStack {
            Color(.second)
                .cornerRadius(16)
                
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                Spacer()
                Text(text)
                Spacer()
            }
            .padding(.horizontal, 35)
            .foregroundStyle(.white)
            .font(.system(size: 16, weight: .heavy))
        }
        .frame(width: 336, height: 84)
    }
}

#Preview {
    SettingButton()
}

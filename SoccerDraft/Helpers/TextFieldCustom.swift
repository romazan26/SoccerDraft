//
//  TextFieldCustom.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI

struct TextFieldCustom: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.second
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
            }
            TextField("", text: $text)
                .padding()
                .foregroundStyle(.white)
        }
        .cornerRadius(12)
        .frame(maxWidth: .infinity)
        .frame(height: 69)
    }
}

#Preview {
    TextFieldCustom( text: .constant(""))
}

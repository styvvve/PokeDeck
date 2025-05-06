//
//  AllTypesButton.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 06/05/2025.
//

import SwiftUI

struct AllTypesButton: View {
    var body: some View {
        Text("Tous")
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .background(.tint)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
            .font(.system(size: 14))
            .fontWeight(.bold)
    }
}

#Preview {
    AllTypesButton()
}

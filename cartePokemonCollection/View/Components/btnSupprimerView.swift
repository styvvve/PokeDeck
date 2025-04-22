//
//  btnSupprimerView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 13/12/2024.
//

import SwiftUI

struct btnSupprimerView: View {
    
    @Binding var myCollection: [Carte]
    @Binding var carte: Carte
    
    var body: some View {
        Button {
            
        }label: {
            Image(systemName: "trash.fill")
                .padding()
                .background(.red)
                .font(.system(size: 25))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    btnSupprimerView(myCollection: .constant([]), carte: .constant(pikachu))
}

//
//  numeroSetCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 13/12/2024.
//

import SwiftUI

struct numeroSetCarteView: View {
    
    let carte: Carte
    
    var body: some View {
        HStack {
            Text("Numéro dans le set : ")
                .font(.system(size: 20))
                .bold()
            Spacer()
            Text(String(carte.numero))
        }.padding(.horizontal, 10)
    }
}

#Preview {
    numeroSetCarteView(carte: pikachu)
}

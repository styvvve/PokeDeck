//
//  rareteCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct rareteCarteView: View {
    
    let  carte: Carte
    
    var body: some View {
        HStack {
            Text("Rareté : ")
                .font(.system(size: 20))
                .bold()
            Spacer()
            Text(carte.rarete)
        }.padding(.horizontal, 10)
    }
}

#Preview {
    rareteCarteView(carte: pikachu)
}

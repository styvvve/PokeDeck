//
//  pvCartePokemon.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 13/12/2024.
//

import SwiftUI

struct pvCartePokemon: View {
    
    let carte: Carte
    
    var body: some View {
        HStack {
            Text("PV : ")
                .font(.system(size: 20))
                .bold()
            Spacer()
            Text(String(carte.pv))
        }.padding(.horizontal, 10)
    }
}

#Preview {
    pvCartePokemon(carte: pikachu)
}

//
//  typeCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct typeCarteView: View {
    
    let carte: Carte
    
    var body: some View {
        HStack {
            Text("Type(s) : ")
                .font(.system(size: 20))
                .bold()
            Spacer()
            ForEach(carte.type, id: \.self) { typ in
                afficherTypeView(color: couleurPokemonTypes[typ] ?? .gray, type: typ)
            }
        }.padding(.horizontal, 10)
    }
}

#Preview {
    typeCarteView(carte: florizarre)
}

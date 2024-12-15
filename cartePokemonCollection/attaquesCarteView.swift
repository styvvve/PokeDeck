//
//  attaquesCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 13/12/2024.
//

import SwiftUI

struct attaquesCarteView: View {
    
    let carte: Carte
    
    var body: some View {
        HStack {
            Text("Attaques : ")
                .font(.system(size: 20))
                .bold()
            Spacer()
            ForEach(0..<carte.attaques.count) { i in
                Text(i < carte.attaques.count-1 ? "\(carte.attaques[i]), " : carte.attaques[i])
            }
        }.padding(.horizontal, 10)
    }
}

#Preview {
    attaquesCarteView(carte: pikachu)
}

//
//  nomCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct nomCarteView: View {
    
    let carte: Carte
    
    var body: some View {
        HStack {
            Text("Nom : ")
                .font(.system(size: 20))
                .bold()
            Spacer()
            Text(carte.nom)
                .font(.system(size: 20))
                .bold()
                .foregroundStyle(carte.color)
        }.padding(.horizontal, 10)
    }
}

#Preview {
    nomCarteView(carte: pikachu)
}

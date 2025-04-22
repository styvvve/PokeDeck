//
//  afficherTypeView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

//une vue pour afficher le type d'un pokemon
//on stocke les différents type dans le fichier PokemonTypes

struct afficherTypeView: View {
    
    let color: Color
    let type: String
    
    var body: some View {
        Text(type)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
            .font(.system(size: 14))
            .fontWeight(.bold)
    }
}

/*#Preview {
    afficherTypeView(color: .yellow, type: pokemonTypes[4])
}*/

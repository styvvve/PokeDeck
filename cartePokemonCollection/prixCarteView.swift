//
//  prixCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 13/12/2024.
//

import SwiftUI

struct prixCarteView: View {
    
    let carte: Carte
    
    var body: some View {
        HStack {
            Text("Prix : ")
                .font(.system(size: 20))
                .bold()
            Spacer()
            Text("\(String(format: "%.2f", carte.prix))€")
        }.padding(.horizontal, 10)
    }
}

#Preview {
    prixCarteView(carte: pikachu)
}

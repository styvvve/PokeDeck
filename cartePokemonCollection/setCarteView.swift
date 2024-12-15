//
//  setCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 13/12/2024.
//

import SwiftUI

struct setCarteView: View {
    
    let carte: Carte
    
    var body: some View {
        HStack {
            Text("Set : ")
                .font(.system(size: 20))
                .bold()
            Spacer()
            Text(carte.set)
        }.padding(.horizontal, 10)
    }
}

#Preview {
    setCarteView(carte: pikachu)
}

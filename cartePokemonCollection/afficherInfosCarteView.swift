//
//  afficherInfosCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct afficherInfosCarteView: View {
    
    @Binding var myCollection: [Carte]
    @Binding var carte: Carte
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                carte.image
                    .resizable()
                    .frame(width: 250, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(height: 10)
                Divider()
                VStack(alignment: .leading) {
                    nomCarteView(carte: carte)
                    Divider()
                    typeCarteView(carte: carte)
                    Divider()
                    rareteCarteView(carte: carte)
                    Divider()
                    setCarteView(carte: carte)
                    Divider()
                    numeroSetCarteView(carte: carte)
                    Divider()
                    attaquesCarteView(carte: carte)
                    Divider()
                    prixCarteView(carte: carte)
                }.padding(.vertical)
                
                btnSupprimerView(myCollection: $myCollection, carte: $carte)
                    .onTapGesture {
                        dismiss()
                    }
            }.padding()
        }
    }
}

#Preview {
    afficherInfosCarteView(myCollection: .constant([]), carte: .constant(pikachu))
}

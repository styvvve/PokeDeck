//
//  CardCell.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 24/04/2025.
//

import SwiftUI

struct CardCell: View {
    
    @Bindable var card: Carte
    
    var body: some View {
        HStack {
            card.image
                .resizable()
                .frame(width: 100, height: 150)
            
            VStack(alignment: .leading) {
                Text(card.nom)
                    .font(.title)
                    .bold()
                Text("Rareté : \(card.rarete)")
                    .foregroundStyle(.gray)
                HStack {
                    ForEach(card.type, id: \.self) { typ in
                        afficherTypeView(type: typ)
                    }
                }
            }
            .padding(.horizontal)
            .offset(y: -15)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CardCell(card: pikachu)
}

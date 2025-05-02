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
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 100, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(card.nom)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                Text(card.rarete.localizedName)
                    .padding()
                    .bold()
                    .background(card.rarete.getColor)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .padding(.horizontal)
            .offset(y: -15)
            
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 28))
                .foregroundStyle(.black)
           
        }
        .padding()
        .background(card.color)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    CardCell(card: pikachu)
}

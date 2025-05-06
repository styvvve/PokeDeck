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
            VStack {
                card.image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 75, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .shadow(radius: 5)
            }
            VStack(alignment: .leading) {
                Text(card.nom)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                    .padding(.top)
                Divider()
                Text(card.rarete.localizedName)
                    .bold()
            }
            .padding(.horizontal)
            .offset(y: -15)
            
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 28))
                .foregroundStyle(.black)
           
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .shadow(radius: 5)
    }
}

#Preview {
    CardCell(card: pikachu)
}

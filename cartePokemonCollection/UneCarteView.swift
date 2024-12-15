//
//  UneCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct UneCarteView: View {
    
    let carte: Carte
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center){
                carte.image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading) {
                    Text(carte.nom)
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundStyle(carte.color)
                    Text("Prix: \(String(format: "%.2f", carte.prix))€") //on formate le prix pour afficher uniquement deux decimales
                        .font(.subheadline)
                        .foregroundStyle(Color(UIColor.systemGray))
                    HStack {
                        ForEach(carte.type, id: \.self) { typ in
                            afficherTypeView(color: couleurPokemonTypes[typ] ?? .gray, type: typ)
                            // force l'utilisation d'optionnel car un dictionnaire renvoie automatiquement un optionnel soit si la valeur n'est pas trouve mais dans notre cas ce sera jms le cas
                        }
                    }
                }.padding(.horizontal, 10)
                Spacer()
            }.padding(.horizontal, 10)
        }
    }
}

#Preview {
    UneCarteView(carte: dracaufeu)
}

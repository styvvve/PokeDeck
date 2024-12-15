//
//  displayTypesInHorizontalScrollView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 14/12/2024.
//

import SwiftUI

struct displayTypesInHorizontalScrollView: View {
    
    @Binding var typeSelectionne: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(pokemonTypes, id: \.self) { typ in
                    afficherTypeView(color: couleurPokemonTypes[typ] ?? .gray, type: typ)
                        .onTapGesture {
                            ajouterOuSupprimer(typ)
                            print(typeSelectionne)
                        }
                        .opacity(isSelectionned(typ) ? 1 : 0.5)
                }
            }.padding(.horizontal, 10)
        }
    }
    
    //fct pour verifier qu'un element est selectionne
    func isSelectionned(_ elt: String) -> Bool {
        for one in typeSelectionne {
            if one == elt {
                return true
            }
        }
        return false
    }
    
    //fonction lorque l'on clique sur un element
    func ajouterOuSupprimer(_ elt: String) {
        if isSelectionned(elt) {
            typeSelectionne.remove(at: typeSelectionne.firstIndex(of: elt)!) //retourne un optionnel
        }else {
            typeSelectionne.append(elt)
        }
    }
}


#Preview {
    displayTypesInHorizontalScrollView(typeSelectionne: .constant([]))
}

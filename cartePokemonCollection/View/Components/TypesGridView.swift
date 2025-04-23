//
//  TypesGridView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 23/04/2025.
//

import SwiftUI

struct TypesGridView: View {
    
    //comment va s'afficher la grille
    let colonnes = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @Binding var typeSelectionne: [Types]
    
    var body: some View {
        LazyVGrid(columns: colonnes, spacing: 10) {
            ForEach(Types.allCases, id: \.self) { typ in
                afficherTypeView(type: typ)
                    .opacity(typeSelectionne.contains(typ) ? 1 : 0.5)
                    .onTapGesture {
                        if typeSelectionne.count == 3 {
                            typeSelectionne.removeFirst()
                        }
                        if typeSelectionne.contains(typ) {
                            typeSelectionne.remove(at: typeSelectionne.firstIndex(of: typ)!)
                        }else {
                            typeSelectionne.append(typ)
                        }
                    }
            }
        }
    }
}

#Preview {
    TypesGridView(typeSelectionne: .constant([]))
}

//
//  displayTypesInHorizontalScrollView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 14/12/2024.
//

import SwiftUI

struct displayTypesInHorizontalScrollView: View {
    
    @Binding var typeSelectionne: [Types]
    @State private var boutonTousActif: Bool = true
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                AllTypesButton()
                    .opacity(boutonTousActif ? 1 : 0.5)
                    .onTapGesture {
                        toggleBoutonTous()
                    }
                ForEach(Types.allCases, id: \.self) { typ in
                    afficherTypeView(type: typ)
                        .opacity(typeSelectionne.contains(typ) ? 1 : 0.5)
                        .onTapGesture {
                            if typeSelectionne.contains(typ) && boutonTousActif {
                                typeSelectionne.remove(at: typeSelectionne.firstIndex(of: typ)!)
                                boutonTousActif.toggle()
                            } else if typeSelectionne.contains(typ) && !boutonTousActif {
                                typeSelectionne.remove(at: typeSelectionne.firstIndex(of: typ)!)
                            } else {
                                typeSelectionne.append(typ)
                            }
                        }
                }
            }
            .padding()
        }
        .onAppear {
            if boutonTousActif {
                for typ in Types.allCases {
                    typeSelectionne.append(typ)
                }
            }
        }
    }
    
    private func toggleBoutonTous() -> Void {
        if boutonTousActif {
            typeSelectionne.removeAll()
            boutonTousActif.toggle()
        }else {
            //on met tous les types dans l'array
            for typ in Types.allCases {
                typeSelectionne.append(typ)
            }
            boutonTousActif.toggle()
        }
    }
}


#Preview {
    displayTypesInHorizontalScrollView(typeSelectionne: .constant([]))
}

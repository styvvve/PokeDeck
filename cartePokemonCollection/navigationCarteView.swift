//
//  navigationCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct navigationCarteView: View {
    
    @Binding var myCollection: [Carte]
    @Binding var typeSelectionne: [String]
    @State var showingAjouterScreen = false
    @Binding var searchText: String
    
    var body: some View {
        NavigationStack {
            displayTypesInHorizontalScrollView(typeSelectionne: $typeSelectionne)
            List(displayable) { one in
                NavigationLink {
                    afficherInfosCarteView(myCollection: $myCollection, carte: one)
                }label: {
                    UneCarteView(carte: one)
                }
            }.listStyle(.plain)
                .navigationTitle("Ma collection")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showingAjouterScreen.toggle()
                        }label: {
                            Image(systemName: "plus")
                        }.sheet(isPresented: $showingAjouterScreen) {
                            ajouterCarteView(myCollection: $myCollection)
                        }
                    }
                }
        }.searchable(text: $searchText)
        var displayable: [Carte] {
            if !searchText.isEmpty && typeSelectionne.isEmpty {
                return myCollection.filter { $0.nom.contains(searchText) }
            }else if searchText.isEmpty && !typeSelectionne.isEmpty {
                return myCollection.filter { typeSelectionne.contains($0.type) }
            }else {
                return myCollection
            }
        }
    }
}

#Preview {
    navigationCarteView(myCollection: .constant([pikachu, dracaufeu, florizarre, tortank]), typeSelectionne: .constant([]), searchText: .constant(""))
}

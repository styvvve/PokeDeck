//
//  HomeView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var myCollection: [Carte]
    @Binding var typeSelectionne: [String]
    @Binding var searchText: String
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                navigationCarteView(myCollection: $myCollection, typeSelectionne: $typeSelectionne, searchText: $searchText)
            }
            Tab("Profil", systemImage: "person.crop.circle") {
                
            }
        }
    }
}

#Preview {
    HomeView(myCollection: .constant([pikachu, dracaufeu, florizarre, tortank]), typeSelectionne: .constant([]), searchText: .constant(""))
}

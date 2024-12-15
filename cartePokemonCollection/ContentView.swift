//
//  ContentView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var myCollection: [Carte]
    @State var typeSelectionne: [String]
    @State var searchText: String
    @State var carte: Carte
    
    var body: some View {
        HomeView(myCollection: $myCollection, typeSelectionne: $typeSelectionne, searchText: $searchText)
    }
}

#Preview {
    ContentView(myCollection: [pikachu], typeSelectionne: [], searchText: "", carte: pikachu)
}

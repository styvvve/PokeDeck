//
//  cartePokemonCollectionApp.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

@main
struct cartePokemonCollectionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(myCollection: [pikachu], typeSelectionne: [], searchText: "", carte: pikachu)
        }
    }
}

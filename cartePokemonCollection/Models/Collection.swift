//
//  Collection.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 07/05/2025.
//

import Foundation
import SwiftData

@Model
class Collection : Identifiable {
    var id = UUID()
    var nom: String
    @Relationship(deleteRule: .cascade) var cartes: [Carte] = []
    
    init(id: UUID = UUID(), nom: String, cartes: [Carte]) {
        self.id = id
        self.nom = nom
        self.cartes = cartes
    }
    
    func ajouterCarte(_ carte: Carte) {
        cartes.append(carte)
    }
}

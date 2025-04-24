//
//  CarteViewModel.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 24/04/2025.
//

import Observation
import SwiftData
import SwiftUI

@Observable
class CarteViewModel {
    var modelContext: ModelContext
    var cartes = [Carte]()
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchCartes()
    }
    
    func fetchCartes() {
        do {
            let descriptor = FetchDescriptor<Carte>(sortBy: [SortDescriptor(\.dateAcquisition, order: .reverse)])
            cartes = try modelContext.fetch(descriptor)
        }catch {
            print("Erreur de récupération des cartes")
        }
    }
    
    func ajouterCarte(nom: String, type: [Types], image: UIImage?, color: Color, rarete: echelleRarete, prix: Float, date: Date) {
        let carte = Carte(nom: nom, type: type, rarete: rarete, prix: prix, dateAcquisition: date, image: image, color: color)
        modelContext.insert(carte)
        fetchCartes()
    }
}

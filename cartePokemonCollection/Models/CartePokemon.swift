//
//  CartePokemon.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import Foundation
import SwiftUI

class Carte: Identifiable {
    let id =  UUID()
    var nom: String
    var type: [Types]
    var image: Image
    var color: Color //associe une couleur
    var rarete: echelleRarete
    var prix: Float
    var dateAcquisition: Date
    
    init(nom: String, type: [Types], image: Image, color: Color, rarete: echelleRarete, prix: Float, dateAcquisition: Date) {
        self.nom = nom
        self.type = type
        self.image = image
        self.color = color
        self.rarete = rarete
        self.prix = prix
        self.dateAcquisition = dateAcquisition
    }
}







//definition de quatre cartes (les starters de la 1ere gene + pikachu)
let pikachu =  Carte(
    nom: "Pikachu",
    type: [Types.electrique],
    image: Image("default_image"),
    color: Color(.yellow),
    rarete: echelleRarete.commune,
    prix: 2,
    dateAcquisition: Calendar.current.date(byAdding: .year, value: -1, to: Date())!
)

/*let florizarre = Carte(
    nom: "Florizarre",
    type: [pokemonTypes[3], pokemonTypes[7]],
    image: Image("default_image"),
    color: .green,
    rarete: echelle_rarete[4],
    numero: 3,
    set: "Kanto",
    prix: 50.0, // Prix fictif
    pv: 150, // Points de vie fictifs
    attaques: ["Fouet Liane", "Lance-Soleil", "Drap-Nature", "Toxic"]
)

let dracaufeu = Carte(
    nom: "Dracaufeu",
    type: [pokemonTypes[1], pokemonTypes[9]],
    image: Image("default_image"),
    color: .orange,
    rarete: echelle_rarete[3],
    numero: 6,
    set: "Kanto",
    prix: 80.0, // Prix fictif
    pv: 180, // Points de vie fictifs
    attaques: ["Flamèche", "Lance-Flamme", "Colère", "Surtension"]
)

let tortank = Carte(
    nom: "Tortank",
    type: [pokemonTypes[2]],
    image: Image("default_image"),
    color: .blue,
    rarete: echelle_rarete[2],
    numero: 9, 
    set: "Kanto",
    prix: 60.0, // Prix fictif
    pv: 160, // Points de vie fictifs
    attaques: ["Hydrocanon", "Tunnel", "Morsure", "Canon d'Eau"]
)*/

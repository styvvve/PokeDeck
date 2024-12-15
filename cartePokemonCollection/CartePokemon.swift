//
//  CartePokemon.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import Foundation
import SwiftUI

struct Carte: Identifiable, Equatable {
    let id =  UUID()
    let nom: String
    let type: [String]
    let image: Image
    let color: Color //associe une couleur 
    let rarete: String
    let numero: Int //numero de la carte dans le set
    let set: String //set auquel elle appartient
    let prix: Float
    let pv: Int
    let attaques: [String]
}







//definition de quatre cartes (les starters de la 1ere gene + pikachu)
let pikachu =  Carte(
    nom: "Pikachu",
    type: [pokemonTypes[4]],
    image: Image("default_image"),
    color: Color(.yellow),
    rarete: echelle_rarete[0],
    numero: 25,
    set: "Base Set",
    prix: 2,
    pv: 40,
    attaques: ["Éclair", "Queue de fer"]
)

let florizarre = Carte(
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
)

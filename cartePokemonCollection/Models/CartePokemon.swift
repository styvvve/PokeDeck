//
//  CartePokemon.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Carte: Identifiable {
    @Attribute(.unique) var id =  UUID()
    var nom: String
    var type: [Types]
    var rarete: echelleRarete
    var prix: Float
    var dateAcquisition: Date
    
    //on passera par des propriétes calculees
    var imageData: Data?
    var colorHex: String
    
    var image: Image {
        if let data = imageData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }else {
            return Image(systemName: "photo")
        }
    }
    
    var color: Color {
        Color(hex: colorHex) ?? .gray
    }
    
    init(nom: String, type: [Types], rarete: echelleRarete, prix: Float, dateAcquisition: Date, image: UIImage?, color: Color) {
        self.nom = nom
        self.type = type
        self.rarete = rarete
        self.prix = prix
        self.dateAcquisition = dateAcquisition
        self.imageData = image?.jpegData(compressionQuality: 1.0)
        self.colorHex = color.toHex() ?? "#FFFFFF"
    }
}







//definition de quatre cartes (les starters de la 1ere gene + pikachu)
let pikachu =  Carte(
    nom: "Pikachu",
    type: [.electrique],
    rarete: .commune,
    prix: 2.00,
    dateAcquisition: Date(timeIntervalSince1970: 1714600000),
    image: UIImage(named: "pikachu-image"),
    color: Color.yellow
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

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
            return Image(systemName: "default_image")
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
    
    var dateFormattee: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy à HH:mm"
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: dateAcquisition)
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

let mocks = [
    pikachu,
    Carte(
        nom: "Dracaufeu",
        type: [.feu],
        rarete: .rare,
        prix: 200.00,
        dateAcquisition: Date(timeIntervalSince1970: 1714600000),
        image: UIImage(named: "default_image"),
        color: Color.red
    ),
    Carte(
        nom: "Tortank",
        type: [.eau],
        rarete: .peuCommune,
        prix: 15.00,
        dateAcquisition: Date(timeIntervalSince1970: 1714600000),
        image: UIImage(named: "default_image"),
        color: Color.blue
    )
]

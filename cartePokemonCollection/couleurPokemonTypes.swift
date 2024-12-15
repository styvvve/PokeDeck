//
//  couleurPokemonTypes.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import Foundation
import SwiftUI

//on cree un dictionnaire pour associer une couleur automatique aux types

let couleurPokemonTypes: [String: Color] = [
    "Normal": Color.gray, // 0
    "Feu": Color.red, // 1
    "Eau": Color.blue, // 2
    "Plante": Color.green, // 3
    "Électrique" : Color.yellow, // 4
    "Glace" : Color.cyan, // 5
    "Combat" : Color.orange, // 6
    "Poison" : Color.purple, // 7
    "Sol" : Color.brown, // 8
    "Vol" : Color.blue.opacity(0.6), // on gère l'opacité pour une différente couleur que le bleu tout court
    "Psy" : Color.pink, // 10
    "Insecte" : Color.green.opacity(0.6), // 11
    "Roche" : Color.gray.opacity(0.7), // 12
    "Spectre" : Color.black.opacity(0.7), // 13
    "Dragon" : Color.purple.opacity(0.8), // 14
    "Ténèbres" : Color.black, // 15
    "Acier" : Color.gray.opacity(0.4), // 16
    "Fée" : Color.pink.opacity(0.7) // 17
]


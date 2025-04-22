//
//  PokemonTypes.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import Foundation
import SwiftUI

enum Types: Int, Codable, CaseIterable {
    case normal = 0, feu, eau, plante, electrique, glace, combat, poison, sol, vol, psy, insecte, roche, spectre, dragon, tenebre, acier, fee
    
    var localizedName: String {
        switch self {
        case .normal:
            return "Normal"
        case .feu:
            return "Feu"
        case .eau:
            return "Eau"
        case .plante:
            return "Plante"
        case .electrique:
            return "Électrique"
        case .glace:
            return "Glace"
        case .combat:
            return "Combat"
        case .poison:
            return "Poison"
        case .sol:
            return "Sol"
        case .vol:
            return "Vol"
        case .psy:
            return "Psy"
        case .insecte:
            return "Insecte"
        case .roche:
            return "Roche"
        case .spectre:
            return "Spectre"
        case .dragon:
            return "Dragon"
        case .tenebre:
            return "Ténèbre"
        case .acier:
            return "Acier"
        case .fee:
            return "Fée"
        }
    }
    
    
    var color: Color {
        switch self {
        case .normal:
            return Color.gray
        case .feu:
            return Color.red
        case .eau:
            return Color.blue
        case .plante:
            return Color.green
        case .electrique:
            return Color.yellow
        case .glace:
            return Color.cyan
        case .combat:
            return Color.orange
        case .poison:
            return Color.purple
        case .sol:
            return Color.brown
        case .vol:
            return Color.blue.opacity(0.6)
        case .psy:
            return Color.pink
        case .insecte:
            return Color.green.opacity(0.6)
        case .roche:
            return Color.gray.opacity(0.7)
        case .spectre:
            return Color.black.opacity(0.7)
        case .dragon:
            return Color.purple.opacity(0.8)
        case .tenebre:
            return Color.black
        case .acier:
            return Color.gray.opacity(0.4)
        case .fee:
            return Color.pink.opacity(0.7)
        }
    }
}

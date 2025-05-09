//
//  echelleRarete.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import Foundation
import SwiftUI 

enum echelleRarete: Int, Codable, CaseIterable, Comparable {
    case commune = 1, peuCommune, rare, epique, legendaire, ultraRare
    
    var localizedName: String {
        switch self {
        case .commune:
            return "Commune"
        case .peuCommune:
            return "Peu commune"
        case .rare:
            return "Rare"
        case .epique:
            return "Épique"
        case .legendaire:
            return "Légendaire"
        case .ultraRare:
            return "Ultra-rare"
        }
    }
    
    var getColor: Color {
        switch self {
        case .commune:
            return .gray.opacity(0.5)
        case .peuCommune:
            return .green
        case .rare:
            return .blue
        case .epique:
            return .purple
        case .legendaire:
            return .orange
        case .ultraRare:
            return .red
        }
    }
    
    //methode de comparaison
    static func < (lhs: echelleRarete, rhs: echelleRarete) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

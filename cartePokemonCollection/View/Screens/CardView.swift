//
//  CardView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 26/04/2025.
//

import SwiftUI
import SwiftData

struct CardView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(FetchDescriptor(sortBy: [SortDescriptor(\Carte.dateAcquisition, order: .reverse)])) var cartes: [Carte]
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    VStack {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    CardView()
}

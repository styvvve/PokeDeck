//
//  ContentView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 12/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            Tab("Cartes", systemImage: "rectangle.fill.on.rectangle.fill") {
                
            }
            
            Tab("Collections", systemImage: "books.vertical.fill") {
                
            }
            
            Tab("Plus", systemImage: "ellipsis") {
                
            }
        }
    }
}

#Preview {
    HomeView()
}

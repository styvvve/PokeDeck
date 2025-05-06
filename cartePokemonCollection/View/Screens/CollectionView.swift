//
//  CollectionView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 07/05/2025.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                }
            }
            .navigationTitle(Text("Collections"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    CollectionView()
}

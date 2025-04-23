//
//  RareteEnScrollview.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 23/04/2025.
//

import SwiftUI

struct RareteEnScrollview: View {
    
    @Binding var niveauRareteSelectionne: echelleRarete
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(echelleRarete.allCases, id: \.self) { one in
                    HStack {
                        Text(one.localizedName)
                            .bold()
                        
                    }
                    .padding()
                    .background(isSelectionned(one) ? one.getColor : one.getColor.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .onTapGesture {
                        niveauRareteSelectionne = one
                    }
                }
            }
        }
    }
    
    //MARK: private subviews
    func isSelectionned(_ elt: echelleRarete) -> Bool {
        return elt == niveauRareteSelectionne
    }
}

#Preview {
    RareteEnScrollview(niveauRareteSelectionne: .constant(.commune))
}

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
    @Query private var cartes: [Carte]
    
    @State private var typeSelectionne: [Types] = []
    
    
    //pour la recherche
    @State private var searchText: String = ""
    
    //presenter le sheet pour ajouter une carte
    @State private var isAddingCardScreenPresenting = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    displayTypesInHorizontalScrollView(typeSelectionne: $typeSelectionne)
                    if cartesFiltrees.isEmpty {
                        Text("Aucune carte dans la galerie\nAjoutez une carte en cliquant sur le bouton +")
                            .multilineTextAlignment(.center)
                            .font(.callout)
                            .italic()
                            .foregroundStyle(.black)
                    } else if typeSelectionne.isEmpty {
                        Text("Sélectionnez un type")
                            .multilineTextAlignment(.center)
                            .font(.callout)
                            .italic()
                            .foregroundStyle(.black)
                    }else {
                        ForEach(cartesFiltrees, id: \.self) { carte in
                            NavigationLink {
                                OneCardView(carte: carte)
                            }label: {
                                CardCell(card: carte)
                            }
                        }
                    }
                }
            }
            .background(Color(UIColor.systemGray2))
            .navigationTitle(Text("Cartes"))
            .searchable(text: $searchText, prompt: "Rechercher une carte")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        isAddingCardScreenPresenting.toggle()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isAddingCardScreenPresenting) {
            ajouterCarteView()
        }
    }
    
    //MARK: private
    private var cartesFiltrees: [Carte] {
        if searchText.isEmpty {
            return cartes
        }else {
            return cartes.filter { $0.nom.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    /*func fetchCartes() {
        do {
            let descriptor = FetchDescriptor<Carte>(sortBy: [SortDescriptor(\.dateAcquisition)])
            cartes = try modelContext.fetch(descriptor)
        }catch {
            print("Erreur de fetch \(error.localizedDescription)")
        }
    }*/
}

#Preview {
    CardView()
        .modelContainer(for: Carte.self, inMemory: true)
}

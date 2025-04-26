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
    @State private var cartes: [Carte] = []
    
    
    //pour la recherche
    @State private var searchText: String = ""
    
    //presenter le sheet pour ajouter une carte
    @State private var isAddingCardScreenPresenting = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if cartesFiltrees.isEmpty {
                        Text("Aucune carte dans la galerie\nAjoutez une carte en cliquant sur le bouton +")
                            .multilineTextAlignment(.center)
                            .font(.callout)
                            .italic()
                            .foregroundStyle(.gray)
                    }else {
                        ForEach(cartesFiltrees, id: \.self) { carte in
                            NavigationLink {
                                
                            }label: {
                                CardCell(card: carte)
                            }
                        }
                    }
                }
            }
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
        .onAppear {
            fetchCartes()
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
    
    func fetchCartes() {
        do {
            let descriptor = FetchDescriptor<Carte>(sortBy: [SortDescriptor(\.dateAcquisition)])
            cartes = try modelContext.fetch(descriptor)
        }catch {
            print("Erreur de fetch \(error.localizedDescription)")
        }
    }
}

#Preview {
    CardView()
        .modelContainer(for: Carte.self, inMemory: true)
}

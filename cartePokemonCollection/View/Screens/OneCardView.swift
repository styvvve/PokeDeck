//
//  OneCardView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 01/05/2025.
//

import SwiftUI

struct OneCardView: View {
    
    @Bindable var carte: Carte
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var showConfirmationDelete = false
    
    @State private var isFullScreenPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack(alignment: .center) {
                        Button {
                            isFullScreenPresented = true
                        }label: {
                            VStack {
                                carte.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .frame(width: 250, height: 250)
                                    .shadow(color: carte.color, radius: 5)
                                    .padding(.vertical)
                                
                            }
                        }
                    }
                    .padding()
                    
                    HStack {
                        Text(carte.nom)
                            .font(.title)
                            .bold()
                        
                        Text(carte.rarete.localizedName)
                            .font(.caption)
                            .bold()
                            .padding()
                            .background(carte.rarete.getColor)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                    HStack {
                        ForEach(carte.type, id: \.self) { typ in
                            afficherTypeView(type: typ)
                        }
                    }
                    
                    HStack {
                        Text("Date d'acquisition : ")
                            .bold()
                        Text(carte.dateFormattee)
                        Spacer()
                    }
                    .padding(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(carte.color, lineWidth: 2)
                            .padding()
                    )
                    
                    HStack {
                        Text("Prix : ")
                            .bold()
                        Text(String(format: "%.2f €", carte.prix))
                        Spacer()
                    }
                    .padding(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(carte.color, lineWidth: 2)
                            .padding()
                    )
                    
                    VStack {
                        Button {
                            showConfirmationDelete = true
                        }label: {
                            Image(systemName: "trash")
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .alert("Supprimer cette carte ?", isPresented: $showConfirmationDelete) {
                            Button("Annuler", role: .cancel) {}
                            Button("Supprimer", role: .destructive) {
                                context.delete(carte)
                                try? context.save()
                                dismiss()
                            }
                        } message: {
                            Text("Cette action est irréversible.")
                        }
                    }
                    .padding()
                    
                }
            }
        }
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    carte.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(width: geometry.size.width * 0.90, height: 700)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.05))
                .overlay(
                    Button("Fermer") {
                        isFullScreenPresented = false
                    }
                        .padding()
                    , alignment: .topLeading)
            }
        }
    }
}

#Preview {
    OneCardView(carte: pikachu)
}

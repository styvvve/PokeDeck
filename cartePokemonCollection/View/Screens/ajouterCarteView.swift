//
//  ajouterCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 13/12/2024.
//

import SwiftUI
import PhotosUI

struct ajouterCarteView: View {
    
    @State var nom = ""
    @State var types: [Types] = []
    @State var image: UIImage? = nil
    @State var color: Color = .gray
    @State var rarete: echelleRarete = .commune
    @State var prix: Float = 1.0
    @State private var prixEnString = "1.0" //pour recuperer le prix dans le textField
    @State var dateAcquisition: Date = Date()
    
    //photo
    @State private var showCamera = false
    @State private var isPhotoPickerPresented: Bool = false
    @State private var pickerItem: PhotosPickerItem?
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        Menu {
                            Button("Prendre une photo", action: {
                                showCamera = true
                            })
                            Button("Choisir dans la photothèque", action: {
                                isPhotoPickerPresented = true
                            })
                        }label: {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 150, height: 200)
                                
                                Image(systemName: "plus.circle.fill")
                                    .font(.largeTitle)
                            }
                            .padding()
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Nom de la carte")
                        TextField("Pikachu", text: $nom)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()
                    VStack(alignment: .leading){
                        Text("Rareté de la carte")
                            .padding(.horizontal)
                        RareteEnScrollview(niveauRareteSelectionne: $rarete)
                    }
                    .padding(.vertical)
                    HStack {
                        Text("Couleur de la carte")
                        Spacer()
                        ColorPicker("", selection: $color)
                    }
                    .padding()
                    HStack {
                        Text("Date d'acquisition")
                        Spacer()
                        DatePicker("", selection: $dateAcquisition)
                    }
                    .padding()
                    HStack {
                        Text("Valeur")
                        Spacer()
                        TextField("", text: $prixEnString)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 100)
                            .keyboardType(.decimalPad)
                            .onChange(of: prixEnString) { newValue, _ in
                                if let number = Float(newValue.replacingOccurrences(of: ",", with: ".")) {
                                    prix = number
                                }
                            }
                    }
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Type(s) (jusqu'à trois types)")
                        TypesGridView(typeSelectionne: $types)
                    }
                    .padding()
                    
                    VStack {
                        Button {
                            let nouvelleCarte = Carte(nom: nom, type: types, rarete: rarete, prix: prix, dateAcquisition: dateAcquisition, image: image, color: color)
                            context.insert(nouvelleCarte)
                            try? context.save()
                            print("Nouvelle carte : \(nouvelleCarte.nom)")
                            dismiss()
                        }label: {
                            Text("Ajouter une carte")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .foregroundStyle(.white)
                                .bold()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding()
                }
                .padding()
                
                
            }
            .navigationTitle(Text("Ajouter une carte"))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") {
                        dismiss()
                    }
                }
            }
        }
        .sheet(isPresented: $showCamera, content: {
            CameraView { pickedImage in
                if let uiImage = pickedImage {
                    image = uiImage
                }
                showCamera = false
            }
        })
        .photosPicker(isPresented: $isPhotoPickerPresented, selection: $pickerItem, matching: .images)
        .onChange(of: pickerItem) {
            Task {
                if let loadData = try await pickerItem?.loadTransferable(type: Data.self), let loadedImage = UIImage(data: loadData){
                    image = loadedImage
                }
            }
        }
    }
}

#Preview {
    ajouterCarteView()
}

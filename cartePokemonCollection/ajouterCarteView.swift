//
//  ajouterCarteView.swift
//  cartePokemonCollection
//
//  Created by NGUELE Steve  on 13/12/2024.
//

import SwiftUI

struct ajouterCarteView: View {
    
    @Binding var myCollection: [Carte]
    
    @State var nom = ""
    @State var unType = pokemonTypes[0]
    @State var type: [String] = []
    @State var color = Color.gray
    @State var rarete = echelle_rarete[0]
    @State var numero = 1
    @State var set = ""
    @State var image: Image?
    @State var prix: Float = 1.00
    @State var pv = 1
    @State var attaques = ""
    
    @State private var showAlert = false
    
    
    var body: some View {
        Form {
            Section(header: Text("IMAGE")) {
                btnAjouterImageView()
            }
            Section(header: Text("INFORMATIONS")) {
                HStack {
                    Text("Nom : ")
                    TextField("Pikachu", text: $nom)
                        .multilineTextAlignment(.trailing)
                }
                Picker("Type : ", selection: $unType) {
                    ForEach(pokemonTypes, id: \.self) { typ in
                        Text(typ)
                    }
                }
                HStack {
                    Spacer()
                    Button {
                        //ajouter le type dans le tableau de types
                        type.append(unType)
                    }label: {
                        Text("Ajouter un type")
                    }
                    Spacer()
                }
                HStack {
                    Text("Nom du set : ")
                    TextField("Base Set", text: $set)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Numéro dans le set : ")
                    TextField("1", text: Binding(
                        get: { String(numero) },
                        set: { numero = Int($0) ?? 0 }))
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    
                }
                Picker("Rareté : ", selection: $rarete) {
                    ForEach(echelle_rarete, id: \.self) { marche in
                        Text(marche)
                    }
                }
               
                ColorPicker("Ajouter une couleur", selection: $color)
                HStack {
                    Text("Prix : ")
                    TextField("1", text: Binding(
                        get: { String(prix) },
                        set: { prix = Float($0) ?? 0 }))
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                }
            }
            Section(header: Text("STATS")) {
                HStack {
                    Text("PV : ")
                    TextField("", text: Binding(
                        get: { String(pv) },
                        set: { pv = Int($0) ?? 0 }))
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                }
                TextField("Ajouter les attaques", text: $attaques)
            }
            Section {
                HStack {
                    Spacer()
                    Button {
                        if !nom.isEmpty && !type.isEmpty && !set.isEmpty {
                            ajouterCarte()
                        }else {
                            showAlert.toggle()
                        }
                    }label: {
                        Text("Enregistrer")
                    }.alert("Veuillez remplir tous les champs requis", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    Spacer()
                }
            }
        }
    }
    
    //une fonction qui enregistre la carte qd on a terminé
    func ajouterCarte() {
        let nouvelleAttaques = attaques.split(separator: ",").map {
            String($0).trimmingCharacters(in: .whitespaces)
        } //pour gerer les entrees au niveau des attaques
        let nouvelleCarte = Carte(
            nom: nom,
            type: type,
            image: image ?? Image("default_image"), //deballage si contient pas de valeur utilise celle par defaut
            color: color,
            rarete: rarete,
            numero: numero,
            set: set,
            prix: prix,
            pv: pv,
            attaques: nouvelleAttaques
        )
        
        myCollection.append(nouvelleCarte)
    }
}

#Preview {
    ajouterCarteView(myCollection: .constant([pikachu, dracaufeu, florizarre, tortank]))
}

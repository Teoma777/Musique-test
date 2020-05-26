//
//  ModifProfilView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct ModifProfilView: View {
    @State private var enableMedia = false
    var notificationMode = ["À personne", "Seulement aux amis", "À tout le monde"]
    @State private var selectedMode = 0
    @State var username: String = ""
    @State var bio: String = ""
    @State private var showingImagePicker = false
    var body: some View {
      
            Form {
                
                Section(header: Text("Image Profil")
                    .font(.headline)) {
                    VStack (alignment: .center){
                        NavigationLink(destination : PickImageView()) {
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width : 150, height : 150)
                        
                    }
                    }
                }
                Section(header: Text("Bannière")
                    .font(.headline)) {
                    VStack (alignment: .center){
                        NavigationLink(destination : PickImageView()) {
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width : 300, height : 150)
                        
                    }
                    }
                }
                
                Section(header: Text("Nom utilisateur")
                    .font(.headline)) {
                    VStack (alignment: .leading){
                        TextField("Entrer nom", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 10)
                        
                    }
                    
                }
                Section(header: Text("Bio")
                    .font(.headline)) {
                    VStack (alignment: .leading){
                        TextField("Ajouter texte", text: $bio)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 10)
                    }
                    
                }
                Section(header: Text("Medias")
                    .font(.headline)){
                    Toggle(isOn: $enableMedia) {
                        Text("Montrer medias")
                    }
                    
                    
                }
            } .navigationBarItems(trailing:
            //Text("Filtres")
            NavigationLink(destination: ModifProfilView()) {
                Text("Profil")
            }
                .foregroundColor(.blue))
            .navigationBarTitle(Text("Valider"), displayMode: .inline)
            .resignKeyboardOnDragGesture()
        
        
    }
}

struct ModifProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ModifProfilView()
    }
}

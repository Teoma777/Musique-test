//
//  ForgottenPasswordView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct ForgottenPasswordView: View {
    @State private var mail = ""
    @State private var selectedItem = 1
    
    var body: some View {
        ZStack{
         Color.orange.edgesIgnoringSafeArea(.all)
            VStack {
                Section {
                    
                    
                    Spacer().frame(width: 100.0, height: 40.0)
                    
                    
                    Text("Si vous avez oublié votre mot de passe, merci de saisir votre adresse email. Un email vous sera envoyé et vous permettra de modifier/réinitialiser votre mot de passe.")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading).padding(.horizontal, 50)
                        .navigationBarTitle("Mot de passe oublié")
                        .multilineTextAlignment(.center)
                    
                    
                    Spacer().frame(width: 100.0, height: 40.0)
                    
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        
                        TextField("Entrer votre adresse mail", text: self.$mail)
                        
                    }.padding(.vertical)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    
                    
                    Spacer().frame(width: 100.0, height: 50.0)
                    
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Envoyer mail")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                        
                    }.background(Color.gray)
                    
                    .cornerRadius(8)
                    .offset(y: -75)
                    .padding(.bottom, -40)
                    .shadow(radius: 15)
                    
            
                    
                }
            }
    }
}
}
struct ForgottenPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgottenPasswordView()
    }
}

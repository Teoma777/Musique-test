//
//  InscriptionView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct InscriptionView: View {
    var body: some View {
        ZStack{
                    
            Color.clear.edgesIgnoringSafeArea(.all)
                    
                    if UIScreen.main.bounds.height > 800{
                        
                        Screen()
                    }
                    else{
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            Screen()
                        }
                    }
                }
      
            }
        }
        
        struct InscriptionView_Previews: PreviewProvider {
            static var previews: some View {
                InscriptionView()
            }
        }
        
        struct Screen : View {
            
            @State var index = 0
            
            var body : some View{
                
                VStack{
                    
                    Image("logo")
                    .resizable()
                    .frame(width: 180, height: 180)
                    
                    HStack{
                        
                        Button(action: {
                            
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                                
                               self.index = 0
                            }
                            
                        }) {
                            
                            Text("Connexion")
                                .foregroundColor(self.index == 0 ? .black : .black)
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                            
                        }.background(self.index == 0 ? Color.gray : Color.clear)
                        .clipShape(Capsule())
                        
                        Button(action: {
                            
                           withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                               
                              self.index = 1
                           }
                    
                        }) {
                            
                            Text("Inscription")
                                .foregroundColor(self.index == 1 ? .black : .black)
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                            
                        }.background(self.index == 1 ? Color.gray : Color.clear)
                        .clipShape(Capsule())
                        
                    }.background(Color.black.opacity(0.1))
                    .clipShape(Capsule())
                    .padding(.top, 25)
                    
                    if self.index == 0{
                        
                        Login()
                    }
                    else{
                        
                        SignUp()
                    }
                    
                    if self.index == 0{
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Mot de passe oublié ?")
                                .foregroundColor(.black)
                        
                        }
                        .padding(.top, 20)
                    }
                
                    
                
                }
                
            }
        }
        
        struct Login : View {
            
            @State var mail = ""
            @State var pass = ""
            
            var body : some View{
                
                VStack{
                    
                    VStack{
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "envelope")
                                .foregroundColor(.black)
                            
                            TextField("Entrer votre adresse mail", text: self.$mail)
                            
                        }.padding(.vertical, 20)
                        
                        Divider()
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                            .foregroundColor(.black)
                            
                            SecureField("Mot de passe", text: self.$pass)
                            
                            Button(action: {
                                
                            }) {
                                
                                Image(systemName: "eye")
                                    .foregroundColor(.black)
                            }
                            
                        }.padding(.vertical, 20)
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 25)
                    
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Connexion")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                        
                    }.background(Color.gray)
                    
                    .cornerRadius(8)
                    .offset(y: -40)
                    .padding(.bottom, -40)
                    .shadow(radius: 15)
                }
            }
        }
        
        struct SignUp : View {
            
            @State var mail = ""
            @State var pass = ""
            @State var repass = ""
            
            var body : some View{
                
                VStack{
                    
                    VStack{
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "envelope")
                                .foregroundColor(.black)
                            
                            TextField("Entrer votre adresse mail", text: self.$mail)
                            
                        }.padding(.vertical, 20)
                        
                        Divider()
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                            .foregroundColor(.black)
                            
                            SecureField("Mot de passe", text: self.$pass)
                            
                            Button(action: {
                                
                            }) {
                                
                                Image(systemName: "eye")
                                    .foregroundColor(.black)
                            }
                            
                        }.padding(.vertical, 20)
                        
                        Divider()
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                            .foregroundColor(.black)
                            
                            SecureField("Confirmation mot de passe", text: self.$repass)
                            
                            Button(action: {
                                
                            }) {
                                
                                Image(systemName: "eye")
                                    .foregroundColor(.black)
                            }
                            
                        }.padding(.vertical, 20)
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 25)
                    
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Inscription")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                        
                    }.background(Color.gray)
                    .cornerRadius(8)
                    .offset(y: -40)
                    .padding(.bottom, -40)
                    .shadow(radius: 15)
                }
            }
        }



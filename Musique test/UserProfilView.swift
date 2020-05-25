//
//  UserProfilView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct UserProfilView: View {
   @State var selected = 0
    var body: some View {
        NavigationView{
            ScrollView {
            ZStack {
                Image("saxophone")
                    .resizable()
                    .frame(width:420, height: 250)
                    .position(x: 210, y: 60)
                VStack{
                    
                    Image("woman")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 180.0, height: 180.0, alignment: .center).foregroundColor(Color.red)
                        .clipShape(Circle())
                    
                    Text("Emma")
                        .font(.title)
                    Spacer().frame(height: 350)
                   }
            
          
                
                HStack{
                Button(action: {
                 playSound(music: "Test", type: "mp3")
                  print("appuyer bouton")
                }) {
                  
                    Image(systemName: "play.circle")
                  .resizable()
                      .frame(width:50, height: 50)
                
                }
                      Button(action: {
                       stopSound(music: "Test", type: "mp3")
                        print("appuyer bouton")
                      }) {
                        
                          Image(systemName: "pause.circle")
                        .resizable()
                            .frame(width:50, height: 50)
                      
                      }
                      }
                
                 VStack(spacing: 20){
                                        Spacer()
                                          .frame(height: 320)
                                        Segmentedbar(selected: self.$selected).padding(.top)
                                  
                                        if self.selected == 0{
                                                
                                                Bio2()
                                            }
                                            else{
                                                
                                                Medias2()
                                            }
                                            
                              }
                }
                }
            
            }
            
        }
    }


struct UserProfilView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilView()
    }
}
struct Bio2 : View {
    
    var body : some View{
        VStack{
            Text("#Jazz   #Saxophone   #Paris   #Groupe").foregroundColor(.blue).padding()

            Text("Je m'appelle Emma, j'ai 22 ans et je suis saxophoniste. Je pratique le saxo depuis 6 ans. Fan de jazz j'ai pour projet de fonder un groupe de jazz qui pourrait se produire dans des bars ou autres. Si vous êtes intéressé, envoyez moi une demande d'ami.").padding()
    }
    }
}

struct Medias2 : View {
    
    var body : some View{
        
        VStack{
            
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 80, height: 80)
            Text("Vous n'avez pas accès à cette partie car vous n'êtes pas ami avec cet utilisateur")
                .multilineTextAlignment(.center)
             .foregroundColor(.gray)
        }
    }
}

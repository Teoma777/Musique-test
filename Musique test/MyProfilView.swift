//
//  MyProfilView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI
import AVFoundation



struct MyProfilView: View {
    
   
    
  
    
    
    @State private var selectorIndex = 0
    @State private var pickerSelection = "two"
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Image("bass")
                    .resizable()
                    .frame(width:420, height: 250)
                    .position(x: 210, y: 60)
                VStack{
                    
                    Image("man")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 180.0, height: 180.0, alignment: .center).foregroundColor(Color.red)
                        .clipShape(Circle())
                    
                    Text("Morgan")
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
                
                VStack {
                    Spacer().frame(height: 150)
                    Picker("", selection: $pickerSelection) {
                        Text("Bio").tag("Bio")
                        Text("Media").tag("Media")
                    }
                        
                    .pickerStyle(SegmentedPickerStyle())
                        
                    .padding()
                    if pickerSelection == "Bio" {
                        
                        Text("#Rock   #Bassiste   #Basse").foregroundColor(Color.blue)
                        Text("Je suis bassiste et je cherche un groupe dans le style rock. Je vis à Cognac et j'ai 24 ans. Reste de description flemme d'écrire").padding()
                        
                        
                    } else if pickerSelection == "Media" {
                        
                        HStack{
                            
                            Image("pinterest")
                                .resizable()
                                .frame(width: 75, height: 75)
                            Image("youtube")
                                .resizable()
                                .frame(width: 75, height: 75)
                            Image("insta")
                                .resizable()
                                .frame(width: 75, height: 75)
                        }
                        
                        
                    }
                
                }
            
            }
            
        }
        
        
    }
    
}


struct MyProfilView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfilView()
    }
}



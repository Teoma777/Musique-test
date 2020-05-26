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
    
    @State var selected = 0
    
    
    
    var body: some View {
        
        
        NavigationView{
            ScrollView {
                
                ZStack {
                    Image("bass")
                        .resizable()
                        .frame(width:420, height: 250)
                        .position(x: 210, y: 30)
                    
                    VStack{
                        
                        Image("man")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180.0, height: 180.0, alignment: .center)
                            .clipShape(Circle())
                        
                        Text("Morgan")
                            .font(.title)
                        Spacer().frame(height: 350)
                    }
                    HStack(spacing: 10){
                        Button(action: {
                            playSound(music: "Rock", type: "mp3")
                            print("appuyer bouton")
                        }) {
                            
                            Image(systemName: "play.circle")
                                .resizable()
                                .frame(width:50, height: 50)
                            
                        }
                        Button(action: {
                            stopSound(music: "Rock", type: "mp3")
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
                            
                            Bio()
                        }
                        else{
                            
                            Medias()
                        }
                        
                    }
                    
                    
                }
                
            }
        }
     .navigationBarItems(trailing:
     //Text("Filtres")
     NavigationLink(destination: ModifProfilView()) {
         Text("Profil")
     }
         .foregroundColor(.blue))
     .navigationBarTitle(Text("Modifier"), displayMode: .inline)
     .resignKeyboardOnDragGesture()
    }
}





struct MyProfilView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfilView()
    }
}
struct Segmentedbar : View {
    
    @Binding var selected : Int
    
    var body : some View{
        
        HStack{
            
            Button(action: {
                
                self.selected = 0
                
            }) {
                
              Text("Bio")
                 .foregroundColor(self.selected == 0 ? .black : .black)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .frame(width: 150)
            }.background(self.selected == 0 ? Color.gray : Color.clear)
            .clipShape(Capsule())
           
            
            Button(action: {
                
                self.selected = 1
                
            }) {
                
               Text("Medias")
                .foregroundColor(self.selected == 1 ? .black : .black)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .frame(width: 150)
            }.background(self.selected == 1 ? Color.gray : Color.clear)
            .clipShape(Capsule())
            
            
            }.padding(8)
            .background(Color("Color2"))
            .clipShape(Capsule())
            .animation(.default)
    }
}
struct Bio : View {
    
    var body : some View{
        VStack{
            Text("#Rock   #Bassiste   #Basse").foregroundColor(.blue).padding()

            Text("Je suis bassiste et je cherche un chanteur dans le style rock. Je vis à Cognac et j'ai 24 ans. Pratiquant la basse depuis maintenant 3 ans, je voudrais trouvé un chanteur avec qui pourrait chanter sur mes compositions").padding()
    }
    }
}

struct Medias : View {
    
    var body : some View{
        
        HStack{
            
            Image("Insta")
                .resizable()
                .frame(width: 80, height: 80)
            Image("youtube") .resizable()
                           .frame(width: 80, height: 80)
        }
    }
}

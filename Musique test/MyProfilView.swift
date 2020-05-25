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
                
                
                if UIScreen.main.bounds.height > 800{
                    
                    SegmentedControl()
                }
                else{
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        SegmentedControl()
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

struct SegmentedControl : View {
    
    @State var index = 0
    
    var body : some View{
        
        HStack{
            
            Button(action: {
                
                withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                    
                    self.index = 0
                }
                
            }) {
                
                Text("Connexion")
                    .foregroundColor(self.index == 0 ? .black : .white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                
            }.background(self.index == 0 ? Color.white : Color.clear)
                .clipShape(Capsule())
            
            Button(action: {
                
                withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                    
                    self.index = 1
                }
                
            }) {
                
                Text("Inscription")
                    .foregroundColor(self.index == 1 ? .black : .white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                
            }.background(self.index == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
            
        }.background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            .padding(.top, 25)
        
        
       
        
    }
}

struct Description : View {
    var body : some View{
        HStack{
            Text("test")
            Text("test")
        }
    }
}

struct SocialMedia : View {
    var body : some View{
        Text("test")
    }
}

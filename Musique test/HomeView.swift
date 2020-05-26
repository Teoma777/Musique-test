//
//  HomeView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
        
        List {
        
       HStack{
           Image("woman")
               .resizable()
               .frame(width: 80, height: 80)
               .cornerRadius(50)
           VStack(alignment: .leading){
       Text("Emma")
           .font(.title)
               Text("est désormais votre amie")
               .font(.system(size: 18))
                   Text("Il y a 15 minutes")
                   .font(.system(size: 13))
           }
          
       }
            HStack{
                Image("woman")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                VStack(alignment: .leading){
            Text("Emma")
                .font(.title)
                    Text("vous a envoyé une demande d'ami")
                    .font(.system(size: 18))
                        Text("Il y a 1 heure")
                        .font(.system(size: 13))
                }
               
            }
            HStack{
                        Image("kevin")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(50)
                        VStack(alignment: .leading){
                    Text("Kevin")
                        .font(.title)
                            Text("a ajouté un nouveau morceau à son profil")
                            .font(.system(size: 18))
                                Text("Il y a 2 heures")
                                .font(.system(size: 13))
                        }
                       
                    }
            HStack{
                        Image("man2")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(50)
                        VStack(alignment: .leading){
                    Text("Josh")
                        .font(.title)
                            Text("a mis son profil à jour")
                            .font(.system(size: 18))
                                Text("Il y a 2 heures")
                                .font(.system(size: 13))
                        }
                       
                    }

        }
            .navigationBarTitle(Text("Actualités"), displayMode: .inline)
            .resignKeyboardOnDragGesture()
        }
    }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

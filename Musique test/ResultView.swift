//
//  ResultView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    
    let musicians = [
        Musician(photo: "img", name: "Jean Michel", instrument: "Batterie"),
        Musician(photo: "img", name: "Audrey", instrument: "Chant"),
        Musician(photo: "img", name: "Jacqueline", instrument: "Violon")
    ]
    
    var body: some View {
        
        NavigationView {
        
        List {
        
        ForEach(musicians) {
            musician in
            HStack{
                Image(musician.photo)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                VStack(alignment: .leading){
            Text(musician.name)
                .font(.title)
                    Text(musician.instrument)
                    .font(.system(size: 18))
                }
            }
        }
        }
        .navigationBarItems(leading:
            
            NavigationLink(destination: FiltersView()) {
                Text("< Retour")
            }
                .foregroundColor(.blue))
            .navigationBarTitle(Text("Résultats"), displayMode: .inline)
            .resignKeyboardOnDragGesture()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}

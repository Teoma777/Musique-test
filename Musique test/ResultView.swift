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
        Musician(photo: "woman", name: "Emma", instrument: "Saxophone"),
        Musician(photo: "img", name: "Caroline", instrument: "Piano"),
        Musician(photo: "kevin", name: "Kevin", instrument: "Mélodica")
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
                Spacer()
                Image(systemName: "play.circle")
                .resizable()
                .frame(width: 40, height: 40)
                Spacer()
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

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
                HStack{
                    Button(action: {
                        playSound(music: "piano", type: "mp3")
                        print("appuyer bouton")
                    }) {
                        
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width:50, height: 50)
                        
                    }
                    Button(action: {
                        stopSound(music: "piano", type: "mp3")
                        print("appuyer bouton")
                    }) {
                        
                        Image(systemName: "pause.circle")
                            .resizable()
                            .frame(width:50, height: 50)
                        
                    }
                }
            }
        }
        }

            .navigationBarTitle(Text("Résultats"), displayMode: .inline)
            .resignKeyboardOnDragGesture()
        
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
}

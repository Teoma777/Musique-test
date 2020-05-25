//
//  FriendlistView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct Friend: Identifiable{
    var id = UUID()
    var photo: String
    var name: String
    var instrument: String
    var friend: Bool
}

struct FriendlistView: View {
    let musicians = [
        Friend(photo: "img", name: "Aymeric", instrument: "Batterie", friend: true),
        Friend(photo: "img", name: "Caroline", instrument: "Chant", friend: false),
        Friend(photo: "img", name: "Vincente", instrument: "Violon", friend: true)
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
                if(musician.friend){
                    Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 20, height: 20)
                } else {
                    Image(systemName: "hourglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                }
            }
        }
        }
        
                
            .navigationBarTitle(Text("Amis"), displayMode: .inline)
            .resignKeyboardOnDragGesture()
        }
    }
}

struct FriendlistView_Previews: PreviewProvider {
    static var previews: some View {
        FriendlistView()
    }
}

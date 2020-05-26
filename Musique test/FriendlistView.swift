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
        Friend(photo: "woman", name: "Emma", instrument: "Saxophone", friend: true),
        Friend(photo: "woman2", name: "Audrey", instrument: "Chant", friend: false),
        Friend(photo: "kevin", name: "Kevin", instrument: "Mélodica", friend: true)
    ]
    
    var body: some View {
        
        NavigationView {
        
        List {
        
        ForEach(musicians) {
            musician in
            NavigationLink(destination: ChatView()) {
            HStack{
                 
                Image(musician.photo)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                }
                VStack(alignment: .leading){
            Text(musician.name)
                .font(.title)
                    Text(musician.instrument)
                    .font(.system(size: 18))
                }
                
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

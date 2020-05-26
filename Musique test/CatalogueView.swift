//
//  CatalogueView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct Musician: Identifiable{
    var id = UUID()
    var photo: String
    var name: String
    var instrument: String
}

struct CatalogueView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    let musicians = [
        Musician(photo: "man2", name: "Josh", instrument: "Batterie"),
        Musician(photo: "woman2", name: "Audrey", instrument: "Chant"),
        Musician(photo: "woman3", name: "Jacqueline", instrument: "Violon")
    ]
    
    //let names = ["John", "Joe", "Dana", "Piper"]
    
    var body: some View {
        
        NavigationView {
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("Rechercher", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Fermer") {
                                UIApplication.shared.endEditing(true)
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton)

                List {
                    /*ForEach(self.names.filter {
                        self.searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchText)
                    }, id: \.self) {
                        name in Text(name)
                        
                    }*/
                    
                    
                    
                    ForEach(musicians.filter{$0.instrument.hasPrefix(searchText) || $0.name.hasPrefix(searchText) || searchText == ""}, id: \.id) {
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
                }
            .navigationBarItems(trailing:
                //Text("Filtres")
                NavigationLink(destination: FiltersView()) {
                    Text("Filtres")
                }
                    .foregroundColor(.blue))
                .navigationBarTitle(Text("Recherche"), displayMode: .inline)
                .resignKeyboardOnDragGesture()
            }
        }
    }


struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

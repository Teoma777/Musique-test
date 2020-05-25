//
//  FiltersView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct FiltersView: View {
    let names = ["Rock","Jazz","Metal","Electro","Disco","Blues","Pop","Punk","Musique Classique","Country","Ambient","Chiptune","Dubstep","Eurodance","Hip-Hop","Rap","Samba","Techno","Reggae","Funk","Progressive","Accordéon","Batterie","Guitare","Basse","Flute","Chant","Harpe","Triange","Saxophone","Trompette","Violon","Melodica"]
    
    @State private var searchText = ""
    @State var filteredArray = [String]()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                SearchBarView(searchText: $searchText)
                
                List {
                    
                    ForEach(names.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in
                        
                        Button(action: {
                            
                            self.searchText = searchText
                            
                            if self.searchText == searchText &&
                                !self.filteredArray.contains(self.searchText) {
                                
                                self.filteredArray.append(searchText)
                            }
                            
                        }, label: {
                            Text(searchText)
                            
                        })
                    }
                    
                }
                .navigationBarTitle(Text("Filtres"))
                .resignKeyboardOnDragGesture()
                
                
                ForEach(filteredArray, id: \.self) {text in
                    
                    Text(text)
                        .frame(width:150, height: 20)
                        .foregroundColor(.black)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                    
                    
                    
                }
            }
        }
    }
}

struct SearchBarView: View {
    
    @Binding var searchText: String
    @State private var showCancelButton: Bool = false
    var onCommit: () ->Void = {print("onCommit")}
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                ZStack (alignment: .leading) {
                    if searchText.isEmpty {
                        
                        Text("Recherche")
                    }
                    TextField("", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: onCommit).foregroundColor(.primary)
                }
                
                
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.tertiarySystemFill))
            .cornerRadius(10.0)
            
            if showCancelButton  {
                
                Button("Annuler") {
                    UIApplication.shared.endEditing(true)
                    
                    self.searchText = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(showCancelButton)
    }
}




struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}

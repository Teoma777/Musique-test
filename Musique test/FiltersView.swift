//
//  FiltersView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct FiltersView: View {
    let names = ["Rock","Jazz","Metal","Electro","Disco","Punk","Musique Classique","Country","Ambient","Deathcore","Dubstep","Eurodance","Hip-Hop","Rap","Samba","Techno"]
    
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
                            
                            if self.searchText == searchText {
                                
                                self.filteredArray.append(searchText)
                            }
                            
                        }, label: {
                            Text(searchText)
                        })
                        
                    }
                }
                .frame(height: 300)
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture()
                
                ForEach(filteredArray, id: \.self) {text in
                    Text(text)
                }
                
            }
        }
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
                
                Button("Cancel") {
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



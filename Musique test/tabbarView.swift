//
//  tabbarView.swift
//  Musique test
//
//  Created by thomas groux on 26/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "captions.bubble")
                    Text("Actus")
            }.tag(0)
            CatalogueView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Recherche")
            }.tag(1)
            MyProfilView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profil")
            }.tag(2)
            FriendlistView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Amis")
            }.tag(3)
        }
            
        
    }
}


struct tabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

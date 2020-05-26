//
//  tabbarView.swift
//  Musique test
//
//  Created by thomas groux on 26/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct tabbarView: View {
    var body: some View {
      TabView {
                   Text("VIEW")
                       .tabItem {
                           Image(systemName: "captions.bubble")
                           Text("Actus")
                       }.tag(0)
                   Text("VIEW")
                       .tabItem {
                           Image(systemName: "magnifyingglass")
                           Text("Recherche")
                       }.tag(1)
                    Text("View")
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profil")
                        }.tag(2)
                    Text("View")
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Amis")
                        }.tag(3)
               }

                .edgesIgnoringSafeArea(.top)

            }
        }
    

struct tabbarView_Previews: PreviewProvider {
    static var previews: some View {
        tabbarView()
    }
}

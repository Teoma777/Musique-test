//
//  PickImageView.swift
//  Musique test
//
//  Created by Manon Leghait on 20/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct PickImageView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                    if image != nil {
                        image?
                        .resizable()
                        .scaledToFit()
                    } else {
                        Text("Ajouter une image")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture{
                    self.showingImagePicker = true
                }
                Button("Sauvegarder") {
                    // save the picture
            }
        }
    }
        .padding([.horizontal, .bottom])
    .navigationBarTitle("Choisir Image")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }}

func loadImage() {
    guard let inputImage = inputImage else { return }
    image = Image(uiImage: inputImage)
}
}
struct PickImageView_Previews: PreviewProvider {
    static var previews: some View {
        PickImageView()
    }
}

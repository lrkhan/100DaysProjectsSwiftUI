//
//  ImgPickerView.swift
//  ImageCoreProject
//
//  Created by Luthfor Khan on 1/4/22.
//

import SwiftUI

struct ImgPickerView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
}

struct ImgPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImgPickerView()
    }
}

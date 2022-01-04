//
//  ImagePicker.swift
//  ImageCoreProject
//
//  Created by Luthfor Khan on 1/4/22.
//

import PhotosUI
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        return
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
    
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
}
